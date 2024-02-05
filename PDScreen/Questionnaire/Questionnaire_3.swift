//
//  Questionnaire_3.swift
//  UXUI
//
//  Created by Molly Bradach on 2/4/24.
//

import Foundation
import SwiftUI

struct Questionnaire_3: View {
    @State private var QsToHome = false
    
    var body: some View {
        NavigationStack{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.white,Color.white, Color.mint]),
                           startPoint: .topLeading,
                           endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Do you have any problems with your sense of smell?")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("  ")
                Button(action: {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }) {
                    Text("Yes")
                        .frame(width: 500 , height: 50, alignment: .center)
                }
                .foregroundColor(.white)
                .background(.orange)
                .font(.title)
                .fontWeight(.heavy)
                .cornerRadius(25)
                .padding()
                
                Button(action: {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }) {
                    Text("No")
                        .frame(width: 500 , height: 50, alignment: .center)
                }
                .foregroundColor(.white)
                .background(.orange)
                .font(.title)
                .fontWeight(.heavy)
                .cornerRadius(25)
                .padding()
                
                Button(action: {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }) {
                    Text("Not sure")
                        .frame(width: 500 , height: 50, alignment: .center)
                }
                .foregroundColor(.white)
                .background(.orange)
                .font(.title)
                .fontWeight(.heavy)
                .cornerRadius(25)
                .padding()
                
                Button(action: {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }) {
                    Text("Prefer not to answer")
                        .frame(width: 500 , height: 50, alignment: .center)
                }
                .foregroundColor(.white)
                .background(.orange)
                .font(.title)
                .fontWeight(.heavy)
                .cornerRadius(25)
                .padding()
                
                Text("   ")
                
                Button(action: {QsToHome = true})
                {
                    Text("Submit")
                        .frame(width: 200 , height: 50, alignment: .center)
                }
                .foregroundColor(.black)
                .background(.white)
                .font(.title)
                .cornerRadius(25)
                .padding()
            }
        }
        .navigationDestination(isPresented: $QsToHome) {
            BeginPage()
        }
        }
    }
}


#Preview {
    Questionnaire_3()
}
