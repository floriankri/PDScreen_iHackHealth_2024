//
//  FingerBeginRecording.swift
//  UXUI
//
//  Created by Molly Bradach on 2/2/24.
//

import SwiftUI

struct FingerBeginRecording: View {
    var body: some View {
    
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.white, Color.mint]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        Spacer()
                            .padding(.top, 3.0)
                        HStack{
                            Spacer()
                            Image("fingerL")
                                .resizable()
                                .frame(width: 222.0, height: 239.0)
                            Spacer()
                            Image("arrows")
                                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 5.0, bottom: 0.0, trailing: 0.0))
                                .frame(width: 138.0, height: 40.0)
                            Spacer()
                            Image("fingerpinch")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 159.0, height: 265.0)
                            Spacer()
                        }
                        .padding()
                        .frame(width: 700.0, height: 265.0)
                        Spacer()
                        HStack{
                            Text("Finger Tapping")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, 13.0)
                        

                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.secondary) // You can change the color as desired
                            .padding(10.0)
                            .overlay(
                                Text("""
                                   Make an “L” with your index finger and thumb. Tap those fingers together 10 times.
                                   
                                   """)
                                .font(.system(size: 30))
                                .fontWeight(.medium)
                                .padding(3.0)
                                .foregroundColor(.white) // You can change the text color as desired
                                    .multilineTextAlignment(.leading)
                                    .padding()
                            )
                            .frame(width: 700, height:200) // Adjust the frame size as needed
                        Spacer()
                            .padding()
                        Button(action: {
                            // Your button action here
                        }) {
                            HStack{
                                Image(systemName: "video.fill")
                                    .resizable()
                                
        
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color.white)
                        
                                
                                Text(" Begin Recording")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                            }
                          
                            .padding(.vertical, 40)
                                    .frame(width: 400, height: 113)
                                    .background(Color.donaldDuck)
                                    .cornerRadius(15)
                                
                                
                            
                        }
                        Spacer()
                        
                            
                    }
                    .padding(.bottom, 55.0)
                }
            }
        }

       

   

#Preview {
    FingerBeginRecording()
}
