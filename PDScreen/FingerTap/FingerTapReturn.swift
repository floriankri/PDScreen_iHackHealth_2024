//
//  FingerTapReturn.swift
//  UXUI
//
//  Created by Molly Bradach on 2/2/24.
//

import SwiftUI

struct FingerTapReturn: View {
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
Congratulations on completing the Finger Tap test!
Please proceed to the Gait Test.
""")
                    .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(width: 700.0, height: 220.0)
                }
                Spacer() // Push to the center
                
                NavigationLink(destination: Gait())  {
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
                Spacer()
            }
        }
    }
}

#Preview {
    FingerTapReturn()
}
