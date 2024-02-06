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
                            .frame(height: 100)
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
                        HStack{
                            Text("Finger Tapping")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                            .frame(height: 50)

                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.secondary) // You can change the color as desired
                            .padding()
                            .overlay(
                                Text("""
Make an “L” with your index finger and thumb. Tap those fingers together 10 times.
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
                        
                        NavigationLink(destination: FingerTapReturn())  { // Wrapper
                            // Your button action here
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
                        .navigationBarTitle("", displayMode: .inline)
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                    }
                }
            }
        }

       

   

#Preview {
    FingerBeginRecording()
}
