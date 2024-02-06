

extension ExerciseClassifier {
    /// Creates a shared Exercise Classifier instance for the app at launch.
    static let shared: ExerciseClassifier = {

        // Create an Exercise Classifier instance.
        let exerciseClassifier = ExerciseClassifier()

        return exerciseClassifier
    }()
}
