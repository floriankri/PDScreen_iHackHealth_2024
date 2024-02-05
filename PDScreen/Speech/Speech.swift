//
//  Speech.swift
//  UXUI
//
//  Created by Molly Bradach on 2/2/24.
//

import SwiftUI

struct Speech: View {
    var body: some View {
        
                        ZStack{
                            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white, Color.mint]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomLeading)
                            .edgesIgnoringSafeArea(.all)
                            
                            VStack{
                                Spacer()
                                    .padding(.top, -8.0)
                                    
                                
                                HStack{
                                    Spacer()
                                    Image("speech")
                                        .resizable()
                                    Spacer()
                                }
                                .padding()
                                .frame(width: 273.0, height: 275.0)
                                Spacer()
                                HStack{
                                    Text("Speech Analysis")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }
                                .padding()
                                Spacer()

                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.secondary) // You can change the color as desired
                                    .padding()
                                    .overlay(
                                        Text("""
                                           About 75% of people with PD experience changes in speech and voice.

                                           This test records your voice as you respond to questions.

                                           Place the iPad no farther than arms’ length away from you.
                                           
                                           """)
                                        .font(.system(size: 30))
                                        .fontWeight(.medium)
                                        .padding()
                                        .foregroundColor(.white) // You can change the text color as desired
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                    )
                                    .frame(width: 700, height:400) // Adjust the frame size as needed
                                Spacer()
                                Button(action: {
                                    // Your button action here
                                }) {
                                    Text("Continue")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(40)
                                        .frame(width: 300, height: 113)
                                        .background(Color.donaldDuck)
                                        .cornerRadius(15)
                            
                                        
                                        
                                }
                                .padding(.bottom, 70.0)
                                Spacer()
                                    
                            }
                        }
                    }
                }


#Preview {
    Speech()
}
