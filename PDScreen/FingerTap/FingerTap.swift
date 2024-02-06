//
//  FingerTap.swift
//  UXUI
//
//  Created by Molly Bradach on 2/2/24.
//


import SwiftUI

struct FingerTap: View {
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
                .padding()
                Spacer()

                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.secondary) // You can change the color as desired
                    .padding()
                    .overlay(
                        Text("""
                           This is an exercise to check the speed of your movements.
                           
                           You will be recorded while you carry out this task.
                           
                           Please sit in front of the camera with your hands free and in view.
                           
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
                NavigationLink(destination: FingerBeginRecording())  {
                    // Your button action here
                    Text("Continue")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(40)
                        .frame(width: 250, height: 90)
                        .background(Color.donaldDuck)
                        .cornerRadius(15)
                }
                .navigationBarTitle("", displayMode: .inline)
                Spacer()
                    
            }
        }
    }
}

#Preview {
    FingerTap()
}

