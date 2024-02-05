/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Builds a chain of Combine publisher-subscribers upon the video capture
 session's video frame publisher.
*/

import Vision
import Combine
import CoreImage

protocol VideoProcessingChainDelegate: AnyObject {
    /// Informs the delegate when Vision analyzes an image in the frame chain.
    /// - Parameters:
    ///   - chain: A video-processing chain.
    ///   - poses: An array of poses.
    ///   - frame: A `CGImage` of the frame.
    func videoProcessingChain(_ chain: VideoProcessingChain,
                              didDetect poses: [Pose]?,
                              in frame: CGImage)

    /// Informs the delegate when a video frame chain predicts an action.
    /// - Parameters:
    ///   - chain: A video-processing chain.
    ///   - actionPrediction: An action prediction.
    ///   - duration: The span of time the prediction represents.
    func videoProcessingChain(_ chain: VideoProcessingChain,
                              didPredict actionPrediction: ActionPrediction,
                              for frames: Int)
}

/// Builds a chain of Combine publishers / subscribers from the upstream frame
/// (sample buffer) publisher.
/// - Tag: VideoProcessingChain
struct VideoProcessingChain {
    /// The video-processing chain's delegate.
    ///
    /// Set this property to receive poses and action predictions.
    /// - Tag: delegate-VideoProcessingChain
    weak var delegate: VideoProcessingChainDelegate?

    /// The upstream frame publisher.
    ///
    /// Set this property to begin extracting poses and predicting actions.
    /// - Tag: upstreamFramePublisher
    var upstreamFramePublisher: AnyPublisher<Frame, Never>! {
        didSet { buildProcessingChain() }
    }

    /// A cancellation token for the active video-processing chain.
    ///
    /// To tear down the frame processing chain, call this property's `cancel()`
    /// method, or allow it to deinitialize.
    private var frameProcessingChain: AnyCancellable?

    /// A human body pose request instance that finds poses in each video frame.
    ///
    /// The video-processing chain reuses this instance for all frames from any
    /// upstream publisher.
    /// - Tag: humanBodyPoseRequest
    private let humanBodyPoseRequest = VNDetectHumanBodyPoseRequest()

    /// The action classifier that recognizes exercise activities.
    private let actionClassifier = ExerciseClassifier.shared

    /// The number of pose data instances the action classifier needs
    /// to make a prediction.
    /// - Tag: predictionWindowSize
    private let predictionWindowSize: Int

    /// The number of pose data instances the window advances after each
    /// prediction.
    ///
    /// Increase the stride's value to make predictions less frequently.
    /// - Tag: windowStride
    private let windowStride = 10

    /// A performance reporter that logs the number of predictions and frames
    /// that pass through the chain.
    ///
    /// The reporter prints the prediction and frame counts to the console
    /// every second.
    private var performanceReporter = PerformanceReporter()

    init() {
        predictionWindowSize = actionClassifier.calculatePredictionWindowSize()
    }
}

// MARK: - Combine Chain Builder
extension VideoProcessingChain {
    /// Clears and (re)builds a series of Combine publishers that subscribes to
    /// a video frame publisher and generates action predictions.
    ///
    /// The chain starts with the `upstreamFramePublisher` property and daisy-
    /// chains additional publishers that each subscribe to their upstream publisher.
    /// Each publisher in the chain transforms its input into an output
    /// it publishes to the next publisher in the chain.
    ///
    /// The last publisher in the chain generates action predictions.
    /// The final entity in the chain is a subscriber that receives action
    /// predictions and relays them to the video-processing chain's delegate by
    /// calling its `sendPrediction(_:)`method.
    /// - Tag: buildProcessingChain
    private mutating func buildProcessingChain() {
        // Only continue with a valid upstream frame publisher.
        guard upstreamFramePublisher != nil else { return }

        // Create the chain of publisher-subscribers that transform the raw video
        // frames from upstreamFramePublisher.
        frameProcessingChain = upstreamFramePublisher
            // ---- Frame (aka CMSampleBuffer) -- Frame ----

            // Convert each frame to a CGImage, skipping any that don't convert.
            .compactMap(imageFromFrame)

            // ---- CGImage -- CGImage ----

            // Detect any human body poses (or lack of them) in the frame.
            .map(findPosesInFrame)

            // ---- [Pose]? -- [Pose]? ----

            // Isolate the pose with the largest area in the frame.
            .map(isolateLargestPose)

            // ---- Pose? -- Pose? ----

            // Publish the locations of the pose's landmarks as an
            // `MLMultiArray` to the next subscriber.
            //.map(multiArrayFromPose)

            // ---- MLMultiArray? -- MLMultiArray? ----

            // Gather a window of multiarrays, starting with an empty window.
            //.scan([MLMultiArray?](), gatherWindow)
            .scan([Pose?](), gatherWindow)

            // ---- [MLMultiArray?] -- [MLMultiArray?] ----

            // Only publish a window when it grows to the correct size.
            .filter(gateWindow)

            // ---- [MLMultiArray?] -- [MLMultiArray?] ----

            // Make an activity prediction from the window.
            .map(predictActionWithWindow)

            // ---- ActionPrediction -- ActionPrediction ----

            // Send the action prediction to the delegate.
            .sink(receiveValue: sendPrediction)
    }
}
// MARK: - Transforms for Combine
extension VideoProcessingChain {
    /// Converts a sample buffer into a core graphics image.
    /// - Parameter buffer: A sample buffer, typically from a video capture.
    /// - Returns: A `CGImage` if Core Image successfully converts the sample
    /// buffer; otherwise `nil`.
    /// - Tag: imageFromFrame
    private func imageFromFrame(_ buffer: Frame) -> CGImage? {
        // Inform the performance reporter to log the frame in its count.
        performanceReporter?.incrementFrameCount()

        guard let imageBuffer = buffer.imageBuffer else {
            print("The frame doesn't have an underlying image buffer.")
            return nil
        }

        // Create a Core Image context.
        let ciContext = CIContext(options: nil)

        // Create a Core Image image from the sample buffer.
        let ciImage = CIImage(cvPixelBuffer: imageBuffer)

        // Generate a Core Graphics image from the Core Image image.
        guard let cgImage = ciContext.createCGImage(ciImage,
                                                    from: ciImage.extent) else {
            print("Unable to create an image from a frame.")
            return nil
        }

        return cgImage
    }

    /// Locates human body poses in an image.
    /// - Parameter frame: An image.
    /// - Returns: A `Pose` array if `VNDetectHumanBodyPoseRequest` succeeds
    /// and its `results` property isn't `nil`; otherwise `nil`.
    ///
    /// The method also sends the frame and any poses in it to the delegate.
    /// - Tag: findPosesInFrame
    private func findPosesInFrame(_ frame: CGImage) -> [Pose]? {
        // Create a request handler for the image.
        let visionRequestHandler = VNImageRequestHandler(cgImage: frame)

        // Use Vision to find human body poses in the frame.
        do { try visionRequestHandler.perform([humanBodyPoseRequest]) } catch {
            assertionFailure("Human Pose Request failed: \(error)")
        }

        let poses = Pose.fromObservations(humanBodyPoseRequest.results)

        // Send the frame and poses, if any, to the delegate on the main queue.
        DispatchQueue.main.async {
            self.delegate?.videoProcessingChain(self, didDetect: poses, in: frame)
        }

        return poses
    }

    /// Returns the largest pose by area.
    /// - Parameter poses: A `Pose` array optional.
    /// - Returns: The largest`Pose` when the array isn't empty; otherwise `nil`.
    /// - Tag: isolateLargestPose
    private func isolateLargestPose(_ poses: [Pose]?) -> Pose? {
        return poses?.max(by:) { pose1, pose2 in pose1.area < pose2.area }
    }
    
    private func gatherWindow(previousWindow: [Pose?],
                              pose: Pose?) -> [Pose?] {
        var currentWindow = previousWindow

        // If the previous window size is the target size, it
        // means sendWindowWhenReady() just published an array window.
        if previousWindow.count == predictionWindowSize {
            // Advance the sliding array window by stride elements.
            currentWindow.removeFirst(windowStride)
        }

        // Add the newest multiarray to the window.
        currentWindow.append(pose)

        // Publish the array window to the next subscriber.
        // The currentWindow becomes this method's next previousWindow when
        // it receives the next multiarray from the upstream publisher.
        return currentWindow
    }

    
    private func gateWindow(_ currentWindow: [Pose?]) -> Bool {
        return currentWindow.count == predictionWindowSize
    }

    private func predictActionWithWindow(_ currentWindow: [Pose?]) -> ActionPrediction {
        var poseCount = 0

        // Fill the nil elements with an empty pose array.
        let filledWindow: [Pose] = currentWindow.map { pose in
            if let pose = pose {
                poseCount += 1
                return pose
            } else {
                let emptypose: Pose = Pose.init()
                return emptypose
            }
        }

        // Only use windows with at least 60% real data to make a prediction
        // with the action classifier.
        let minimum = predictionWindowSize * 60 / 100
        guard poseCount >= minimum else {
            return ActionPrediction.noPersonPrediction
        }

        
        let mergedWindow = filledWindow

        // Make a genuine prediction with the action classifier.
        let prediction = actionClassifier.predictActionFromWindow(mergedWindow)

        // Return the model's prediction if the confidence is high enough.
        // Otherwise, return a "Low Confidence" prediction.
        return prediction
    }

    /// Sends an action prediction to the delegate on the main thread.
    /// - Parameter actionPrediction: The action classifier's prediction.
    /// - Tag: sendPrediction
    private func sendPrediction(_ actionPrediction: ActionPrediction) {
        // Send the prediction to the delegate on the main queue.
        DispatchQueue.main.async {
            self.delegate?.videoProcessingChain(self,
                                                didPredict: actionPrediction,
                                                for: windowStride)
        }

        // Inform the performance reporter to log the prediction in its count.
        performanceReporter?.incrementPrediction()
    }
}
