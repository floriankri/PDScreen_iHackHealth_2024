//
//  ContentView.swift
//  PDscreen
//
//  Created by Molly Bradach on 1/31/24.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.mint, Color.mint]),
                               startPoint: .topLeading,
                               endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 250.0) {
                    Spacer()
                    VStack {
                        Text("PDScreen")
                            .font(.system(size: 100, weight: .heavy, design: .default))
                            .padding()
                        
                        Spacer(minLength: 20)
                        
                        Text("Welcome!")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                        
                        NavigationLink(destination: BeginPage())  {
                            // Your button action here
                            Text("Let's begin!")
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
                    .padding()
                    .padding()
                    .background(Rectangle().frame(width: nil).foregroundColor(.white))
                    .cornerRadius(15)
                    .padding(10)
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
    struct MainPage_Previews: PreviewProvider {
        static var previews: some View {
            MainPage()
        }
    }
    
    
