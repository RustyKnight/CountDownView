//
//  ContentView.swift
//  ClockTimer
//
//  Created by Shane Whitehead on 19/1/2024.
//

import SwiftUI

struct ContentView: View {
    let anchorDate = Date()
    
    var body: some View {
        VStack {
            CountUpView(from: anchorDate)
                .padding()
            CountDownView(desiredDuration: Calendar.current.date(byAdding: .minute, value: 5, to: anchorDate)!)
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
