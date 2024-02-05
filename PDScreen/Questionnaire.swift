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
        VStack {
            
            Text("Questionnaire")
                .font(.system(size: 36))
            Text("  ")
            Text("Do you have a diagnosis of REM behavior disorder, also known as RBD?")
            Picker(selection: .constant(1),label: Text("Picker")) {
                Text("Yes").tag(1)
                Text("No").tag(2)
                Text("Not sure").tag(3)
                Text("Prefer not to answer").tag(4)
            }
           
            Text("Have you ever been told, or suspected yourself, that you seem to &quot;act out your dreams while asleep (for example punching, flailing your arms in the air, making running movements, etc.)?")
            Picker(selection: .constant(1),label: Text("Picker")) {
                Text("Yes").tag(1)
                Text("No").tag(2)
                Text("Not sure").tag(3)
                Text("Prefer not to answer").tag(4)
                    }
            
            Text("Do you have any problems with your sense of smell?")
            Picker(selection: .constant(1),label: Text("Picker")) {
                Text("Yes").tag(1)
                Text("No").tag(2)
                Text("Not sure").tag(3)
                Text("Prefer not to answer").tag(4)
            }
            
            
            Text("   ")
            Button("SUBMIT") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            }
        .padding()
    }
}


#Preview {
    Questionnaire()
}
