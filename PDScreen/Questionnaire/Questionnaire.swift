//
//  ContentView.swift
//  fighting park's dizzy wit Andrew and Molly
//
//  Created by Molly Bradach on 1/29/24.
//

import SwiftUI
//import ResearchKit


struct Questionnaire: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.white,Color.white, Color.mint]),
                           startPoint: .topLeading,
                           endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Do you have a diagnosis of REM behavior disorder, also known as RBD?")
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
                
                Button(action: {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }) {
                    Text("Continue")
                        .frame(width: 200 , height: 50, alignment: .center)
                }
                .foregroundColor(.black)
                .background(.white)
                .font(.title)
                .cornerRadius(25)
                .padding()
            }
        }
    }
}


#Preview {
    Questionnaire()
}
