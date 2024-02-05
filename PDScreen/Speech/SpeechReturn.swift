//
//  SpeechReturn.swift
//  UXUI
//
//  Created by Molly Bradach on 2/2/24.
//

import SwiftUI

struct SpeechReturn: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.white,Color.white, Color.mint]),
                           startPoint: .topLeading,
                           endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                //hello user
                Spacer()
                    .frame(height: 450)
                HStack{
                    
                    Text("""
Congratulations on completing the Speech Test!
Please proceed to the Finger Tap Test.
""")
                    .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(width: 700.0, height: 220.0)
                }
                Spacer() // Push to the center
                
                //begin screening button!!
                Button(action: {
                    // Handle button action here
                    print("Button pressed!")
                }) {
                    
                    //begin screening box!
                    HStack {
                    
                        
                        Text("Continue")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.heavy)
                    }
                    .padding()
                    .background(
                        Rectangle()
                            .frame(width: 200.0, height: 100.0)
                            .foregroundColor(Color.donaldDuck) // Set your desired color
                            .cornerRadius(15) // Set corner radius if needed
                    )
                    .padding() // Add padding as needed
                }
                
                Spacer() // Push to the center
            }
        }
    }
}

#Preview {
    SpeechReturn()
}
