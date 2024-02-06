//
//  AboutPage.swift
//  UXUI
//
//  Created by Molly Bradach on 2/2/24.
//

import SwiftUI

struct AboutPage: View {
    @State private var toQuestionnaire = false
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.white,Color.white, Color.mint]),
                           startPoint: .topLeading,
                           endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("What is PDScreen?")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.mint)
                    .padding()
                Spacer()
                HStack{
                    Spacer()
                    NavigationLink(destination: BeginPage()){
                        Image(systemName: "x.circle")
                            .resizable(resizingMode: .tile)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.mint)
                            .frame(width: 50, height: 150)
                    }
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                }
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.secondary) // You can change the color as desired
                    .padding(.top, -50.0)
                    .padding(.leading)
                    .padding(.trailing)
                    .overlay(
                        Text("""
                               PDScreen is a cutting-edge tool designed for accessible and convenient at-home screening for Parkinson’s disease (PD) – the second most common neurodegenerative disease globally.
                               
                               This user-friendly app effortlessly guides you through a series of exercises including speaking, hand movements, and walking. Leveraging the power of artificial intelligence (AI), PDScreen meticulously analyzes your movements, providing valuable health data that you can easily share with your healthcare provider.
                               
                               At PDScreen, our mission is to empower you with autonomy in your health journey, making Parkinson's disease screening a seamless and informative process.
                               """)
                        .font(.system(size: 30))
                        .padding()
                        .foregroundColor(.white) // You can change the text color as desired
                            .multilineTextAlignment(.leading)
                            .padding(.top, -50.0)
                            .padding()
                    )
            }
            .frame(width: 800, height: 900) // Adjust the frame size as needed
        }
    }
}

struct AboutPage_Previews: PreviewProvider {
    static var previews: some View {
        AboutPage()
    }
}

