/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Provides a convenience method that makes a prediction from a multiarray window.
*/

import CoreML

extension ExerciseClassifier {
    /// Predicts an action from a series of landmarks' positions over time.
    /// - Parameter window: An `MLMultiarray` that contains the locations of a
    /// person's body landmarks for multiple points in time.
    /// - Returns: An `ActionPrediction`.
    /// - Tag: predictActionFromWindow
    /*func predictActionFromWindow(_ window: MLMultiArray) -> ActionPrediction {
        
        for i in 0..<window.count {
            window[i]
        }
        
            
        return ActionPrediction(label: "number five", confidence: 0.9)
        /*do {
            let output = try prediction(poses: window)
            let action = Label(output.label)
            let confidence = output.labelProbabilities[output.label]!

            return ActionPrediction(label: action.rawValue, confidence: confidence)
             
        } catch {
            fatalError("Exercise Classifier prediction error: \(error)")
        }*/
    }*/
    
    func predictActionFromWindow(_ poses: [Pose]) -> ActionPrediction {
        
        var changed: CGFloat = 0.0
        
        var distances: [CGFloat] = []
        
        for pose in poses {
            distances.append(pose.landmarkDistance())
        }
        
        // array of distances between ankles
        //var stride_lengths: [CGFloat] = []
        
        var maxBeforeDip: CGFloat? = nil
        var maxReached: CGFloat? = nil

        for element in distances {
            if element > 0.1 {
                if maxReached == nil || element > maxReached! {
                    maxReached = element
                }
            } else {
                if let maxReachedValue = maxReached {
                    if maxReachedValue > 0.1 {
                        // Update the maximum value reached before dipping below 0.1
                        if maxBeforeDip == nil || maxReachedValue > maxBeforeDip! {
                            maxBeforeDip = maxReachedValue
                            changed = 1
                        }
                    }
                }
                maxReached = nil
            }
        }
        
        let formattedString = String(format: "%.3f", maxBeforeDip ?? 0.0)
        let fullString = "Last stride length: \(formattedString)"
            
        return ActionPrediction(label: fullString, confidence: changed)
    }

}
