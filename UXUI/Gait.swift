//
//  Gait.swift
//  UXUI
//
//  Created by Molly Bradach on 2/2/24.
//

import SwiftUI

struct Gait: View {
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
                            Image("gait")
                                .resizable()
                            Spacer()
                        }
                        .padding()
                        .frame(width: 273.0, height: 275.0)
                        Spacer()
                        HStack{
                            Text("Gait Analysis")
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
                                   This exercise examines how you walk.

                                   Please ensure you have a safe space to walk around comfortably, without any obstacles in your way.
                                   
                                   """)
                                .font(.system(size: 30))
                                .fontWeight(.medium)
                                .padding()
                                .foregroundColor(.white) // You can change the text color as desired
                                    .multilineTextAlignment(.leading)
                                    .padding()
                            )
                            .frame(width: 700, height:300) // Adjust the frame size as needed
                        Spacer()
                        
                        NavigationLink(destination: GaitBeginRecording())  {
                            // Your button action here
                            Text("Continue")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(40)
                                .frame(width: 250, height: 90)
                                .background(Color.donaldDuck)
                                .cornerRadius(12)
                            
                        }
                        .navigationBarTitle("", displayMode: .inline)
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                        Spacer()
                            
                    }
                }
            }
        }

        

#Preview {
    Gait()
}
