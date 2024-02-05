//
//  GaitBeginRecording.swift
//  UXUI
//
//  Created by Molly Bradach on 2/2/24.
//

import SwiftUI

struct GaitBeginRecording: View {
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
                .padding(.top, 13.0)
                

                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.secondary) // You can change the color as desired
                    .padding(10.0)
                    .overlay(
                        Text("""
                           Stand up then walk away from the iPad taking about 5 steps then turn around and walk back towards the iPad.
                           
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
                
                NavigationLink(destination: MainPage())  {
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
                Spacer()
                
                    
            }
            .padding(.bottom, 55.0)
        }
    }
}

#Preview {
    GaitBeginRecording()
}
