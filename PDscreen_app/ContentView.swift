//
//  ContentView.swift
//  PDscreen_app
//
//  Created by Florian Kristof on 26.01.24.
//

import SwiftUI

struct ContentView: View {
    @State var count: Int=0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("We are PDscreen!")
        }
        .padding()
        
        VStack(alignment: .center, content: {
            Text("current count: \(count)")
            Button(action: {
                self.count += 1
            }){
                Text("Increment")
            }
        })
    }
}

#Preview {
    ContentView()
}
