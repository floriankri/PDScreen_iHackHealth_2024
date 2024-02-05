/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Defines the Exercise Classifier's frame rate.
 This property reflect the value the model's author set in the
 Create ML developer tool's training parameters.
*/

import CoreML

extension ExerciseClassifier {
    /// The value of the Frame Rate training parameter the action
    /// classifier's creator used in the Create ML developer tool.
    ///
    /// The app configures the device's camera to generate this many frames
    /// per second to match the action classifier's expectations.
    ///
    /// **Note**
    /// If you replace the Exercise Classifier with your own action
    /// classifier model, set this value to match the Frame Rate training
    /// parameter you used in the Create ML developer tool.
    /// - Tag: frameRate
    static let frameRate = 30.0

    /// Returns number of input data samples the model expects in its `poses`
    /// multiarray input to make a prediction. See ExerciseClassifier.mlmodel >
    /// Predictions
    ///
    /// The `keypointsMultiArray()` method of a `VNHumanBodyPoseObservation`
    /// returns a multiarray for one sample.
    ///
    /// The window size is the number of samples you must merge together
    /// by using the `MLMultiArray(concatenating: axis: dataType:)` initializer.
    /// - Tag: calculatePredictionWindowSize
    func calculatePredictionWindowSize() -> Int {

        let windowSize = 90
        let frameRate = ExerciseClassifier.frameRate

        let timeSpan = Double(windowSize) / frameRate
        let timeString = String(format: "%0.2f second(s)", timeSpan)
        let fpsString = String(format: "%.0f fps", frameRate)
        print("Window is \(windowSize) frames wide, or \(timeString) at \(fpsString).")

        return windowSize
    }
}
