//
//  FingerTapReturn.swift
//  UXUI
//
//  Created by Molly Bradach on 2/2/24.
//

import SwiftUI

struct GaitReturn: View {
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
Congratulations on completing the Gait test!
You are all done, please go back to the main page.
""")
                    .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(width: 700.0, height: 220.0)
                }
                Spacer() // Push to the center
                
                NavigationLink(destination: BeginPage())  {
                    // Your button action here
                    Text("Back")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(40)
                        .frame(width: 250, height: 90)
                        .background(Color.donaldDuck)
                        .cornerRadius(12)
                    
                }
                .navigationBarTitle("", displayMode: .inline)
                Spacer()
            }
        }
    }
}

#Preview {
    GaitReturn()
}
