//
//  SpeechRecording.swift
//  UXUI
//
//  Created by Molly Bradach on 2/2/24.
//

import SwiftUI

struct SpeechRecording: View {
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
                                                        Text("""
                                                           Describe your plans for the rest of today.
                                                           
                                                           """)
                                                        .font(.largeTitle)
                                                        .fontWeight(.medium)
                                                        .padding()
                                                        .foregroundColor(.white) // You can change the text color as desired
                                                            .multilineTextAlignment(.leading)
                                                            .padding()
                                                    )
                                                    .frame(width: 700, height:200) // Adjust the frame size as needed
                                                Spacer()
                                                    .frame(height: 170.0)
                                
                                                Button(action: {
                                                    // Your button action here
                                                }) {
                                                    HStack{
                                                        
                                                        Text("Recording in Progress...")
                                                            .font(.largeTitle)
                                                            .fontWeight(.medium)
                                                            .foregroundColor(.white)
                                                        
                                                    }
                                                }
                                                .padding(.vertical, 40)
                                                        .frame(width: 400, height: 113)
                                                        .background(Color.secondary)
                                                        .cornerRadius(15)
                                                    
                                                
                                                Spacer()
                                                    
                                            }
                                        }
                                    }
                                }


#Preview {
    SpeechRecording()
}
