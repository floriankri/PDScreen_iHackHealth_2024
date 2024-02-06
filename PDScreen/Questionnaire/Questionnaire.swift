//
//  ContentView.swift
//  fighting park's dizzy wit Andrew and Molly
//
//  Created by Molly Bradach on 1/29/24.
//

import SwiftUI
//import ResearchKit


struct Questionnaire: View {
    @State private var toPage2 = false
    @State private var didTap1:Bool = false
    @State private var didTap2:Bool = false
    @State private var didTap3:Bool = false
    @State private var didTap4:Bool = false
    
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
                        self.didTap1 = true
                        self.didTap2 = false
                        self.didTap3 = false
                        self.didTap4 = false
                    }) {
                        Text("Yes")
                            .frame(width: 500 , height: 70, alignment: .center)
                    }
                    .foregroundColor(didTap1 ? Color.donaldDuck : Color.white)
                    .background(didTap1 ? Color.donaldDuck.opacity(0.2) : Color.donaldDuck)
                    //.border(.donaldDuck)
                    .font(.title)
                    .fontWeight(.heavy)
                    .cornerRadius(15)
                    
                    .padding()
                    
                    Button(action: {
                        self.didTap2 = true
                        self.didTap1 = false
                        self.didTap3 = false
                        self.didTap4 = false
                    }) {
                        Text("No")
                            .frame(width: 500 , height: 70, alignment: .center)
                    }
                    .foregroundColor(didTap2 ? Color.donaldDuck : Color.white)
                    .background(didTap2 ? Color.donaldDuck.opacity(0.2) : Color.donaldDuck)
                    .font(.title)
                    .fontWeight(.heavy)
                    .cornerRadius(15)
                    .padding()
                    
                    Button(action: {
                        self.didTap3 = true
                        self.didTap1 = false
                        self.didTap2 = false
                        self.didTap4 = false
                    }) {
                        Text("Not sure")
                            .frame(width: 500 , height: 70, alignment: .center)
                    }
                    .foregroundColor(didTap3 ? Color.donaldDuck : Color.white)
                    .background(didTap3 ? Color.donaldDuck.opacity(0.2) : Color.donaldDuck)
                    .font(.title)
                    .fontWeight(.heavy)
                    .cornerRadius(15)
                    .padding()
                    
                    Button(action: {
                        self.didTap4 = true
                        self.didTap1 = false
                        self.didTap2 = false
                        self.didTap3 = false
                    }) {
                        Text("Prefer not to answer")
                            .frame(width: 500 , height: 70, alignment: .center)
                    }
                    .foregroundColor(didTap4 ? Color.donaldDuck : Color.white)
                    .background(didTap4 ? Color.donaldDuck.opacity(0.2) : Color.donaldDuck)
                    .font(.title)
                    .fontWeight(.heavy)
                    .cornerRadius(15)
                    .padding()
                    
                    Text("   ")
                    
                    NavigationLink(destination: Questionnaire_2())
                    {
                        Text("Continue")
                            .frame(width: 200 , height: 50, alignment: .center)
                    }
                    .foregroundColor(.black)
                    .background(.white)
                    .font(.title)
                    .cornerRadius(15)
                    .padding()
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                }
            }
            .navigationDestination(isPresented: $toPage2) {
                Questionnaire_2()
            }
            }
        }
    
#Preview {
    Questionnaire()
}
