//
//  Speech Prompt.swift
//  UXUI
//
//  Created by Molly Bradach on 2/2/24.
//

import SwiftUI
import AVFoundation
import Speech

class AudioRecorder: ObservableObject {
    var audioRecorder: AVAudioRecorder!

    init() {
        setupAudioRecorder()
        addAudioSessionObservers()
    }

    private func setupAudioRecorder() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, options: [.defaultToSpeaker, .allowBluetooth])
            try audioSession.setActive(true)

            let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let audioFilename = documentsPath.appendingPathComponent("recording.wav")

            let settings: [String: Any] = [
                AVFormatIDKey: kAudioFormatLinearPCM,
                AVSampleRateKey: 44100.0,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]

            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.prepareToRecord()
        } catch {
            print("Error setting up audio recorder: \(error.localizedDescription)")
        }
    }

    private func addAudioSessionObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleInterruption), name: AVAudioSession.interruptionNotification, object: AVAudioSession.sharedInstance())
    }

    @objc private func handleInterruption(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
            return
        }

        switch type {
        case .began:
            stopRecording()
        case .ended:
            // Resume recording if needed
            break
        }
    }

    func startRecording(completion: @escaping (Result<URL, Error>) -> Void) {
        let recognizer = SFSpeechRecognizer()

        switch SFSpeechRecognizer.authorizationStatus() {
        case .notDetermined:
            SFSpeechRecognizer.requestAuthorization { status in
                if status == .authorized {
                    self.startRecording(completion: completion)
                }
            }
        case .authorized:
            audioRecorder.record()

            DispatchQueue.main.asyncAfter(deadline: .now() + 10) { // Adjust the duration as needed
                self.stopRecording()
                completion(.success(self.audioRecorder.url))
            }
        default:
            print("Speech recognition not authorized.")
        }
    }

    func stopRecording() {
        audioRecorder.stop()
    }
}

class RecorderViewModel: ObservableObject {
    @Published var isRecording = false
    @Published var transcribedText = ""
    @Published var transcriptionResult: Int? // Added property

    var audioRecorder: AudioRecorder?

    func startRecording() {
        let recognizer = SFSpeechRecognizer()

        switch SFSpeechRecognizer.authorizationStatus() {
        case .notDetermined:
            SFSpeechRecognizer.requestAuthorization { status in
                if status == .authorized {
                    self.startRecording()
                }
            }
        case .authorized:
            audioRecorder = AudioRecorder()
            audioRecorder?.startRecording { [weak self] (result) in
                switch result {
                case .success(let url):
                    self?.transcribeAudio(url: url)
                case .failure(let error):
                    print("Error recording audio: \(error)")
                    self?.transcriptionResult = 1 // Set the result to 1 (failure)
                }
            }
            isRecording = true
        default:
            print("Speech recognition not authorized.")
        }
    }

    func stopRecording() {
        audioRecorder?.stopRecording()
        isRecording = false
    }

    private func transcribeAudio(url: URL) {
        let recognizer = SFSpeechRecognizer()
        let request = SFSpeechURLRecognitionRequest(url: url)

        recognizer?.recognitionTask(with: request) { [weak self] (result, error) in
            guard let result = result else {
                print("There was an error transcribing audio: \(error!)")
                self?.transcriptionResult = 1 // Set the result to 1 (failure)
                return
            }

            if result.isFinal {
                DispatchQueue.main.async { // Update on the main queue
                    self?.transcribedText = result.bestTranscription.formattedString
                    self?.transcriptionResult = 0 // Set the result to 0 (success)
                }
            }
        }
    }
}

struct Speech_Prompt: View {
    @StateObject private var viewModel = RecorderViewModel()

    var body: some View {
                
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white, Color.mint]),
                           startPoint: .topLeading,
                           endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                    .frame(height: 200.0)
                HStack{
                    Spacer()
                    Image("speech")
                        .resizable()
                }
                .frame(width: 273.0, height: 275.0)
                
                    
                HStack{
                    Text("Speech Prompt")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                }
                .padding()
               

                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.secondary) // You can change the color as desired
                    .padding()
                    .overlay(
                        VStack {
                            Text("""
                               Describe your plans for the rest of today.
                               """)
                            .font(.system(size: 30))
                            .fontWeight(.medium)
                            .padding()
                            .foregroundColor(.white) // You can change the text color as desired
                                .multilineTextAlignment(.leading)
                                .padding()
                            
                            Text("Transcribed Text:")

                            TextEditor(text: $viewModel.transcribedText)

                            if let result = viewModel.transcriptionResult {
                                Text("Transcription Result: \(result == 0 ? "Success" : "Failure")")
                            }
                        }
                    )
                    .frame(width: 700, height:200) // Adjust the frame size as needed
                Spacer()
                    .frame(height: 170.0)
                
                Button(action: {
                    if viewModel.isRecording {
                        viewModel.stopRecording()
                    } else {
                        viewModel.startRecording()
                    }
                }) {
                    HStack{
                        Image(systemName: "mic.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.white)
                            .frame(width: 70.0, height: 70.0)
                        
                        Text(viewModel.isRecording ? "Stop Recording" : "Begin Recording")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                .padding(.vertical, 40)
                        .frame(width: 400, height: 113)
                        .background(Color.donaldDuck)
                        .cornerRadius(15)
                Spacer()
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Speech_Prompt()
    }
}

