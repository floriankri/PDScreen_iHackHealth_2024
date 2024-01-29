//
//  ContentView.swift
//  PDscreen_app
//
//  Created by Florian Kristof on 26.01.24.
//

import SwiftUI

struct ContentView: View {
    @State var count: Int=0
    @State var previousPressTime: Date = Date()
    @State var timeIntervals: [TimeInterval] = []
    @State var timeInterval: TimeInterval = 0
    @State var variance: Double = 0.0
    
    func standardDeviation(arr : [Double]) -> Double
    {
        let length = Double(arr.count)
        let avg = arr.reduce(0, {$0 + $1}) / length
        let sumOfSquaredAvgDiff = arr.map { pow($0 - avg, 2.0)}.reduce(0, {$0 + $1})
        return sqrt(sumOfSquaredAvgDiff / length)
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("We are PDscreen!")
        }
        .padding().padding()
        
        VStack(alignment: .center, content: {
            Text("current count: \(count)")
            Text("time since last press: \(timeInterval)")
            Text("variance: \(variance)")
            Button(action: {
                self.count += 1
                
                let currentTime = Date()
                timeInterval = currentTime.timeIntervalSince(previousPressTime)
                timeIntervals.append(timeInterval)
                previousPressTime = currentTime
                variance = standardDeviation(arr: timeIntervals)
            }){
                Text("Increment")
            }
        })
        
    }
}

#Preview {
    ContentView()
}

