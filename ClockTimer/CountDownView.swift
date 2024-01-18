//
//  CountDownView.swift
//  ClockTimer
//
//  Created by Shane Whitehead on 19/1/2024.
//

import Foundation
import SwiftUI

struct CountDownView: View {
    @State private var duration = "---"
    private let desiredDuration: Date
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    static var duratioinFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropLeading
        return formatter
    }()
    
    init(desiredDuration: Date) {
        self.desiredDuration = desiredDuration
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Spacer()
                Text(duration)
                    .font(.system(size: 18, weight: .bold))
                    .padding()
                    .foregroundStyle(Color.white)
                    .background(Color.gray)
                    .cornerRadius(6)
                Spacer()
            }
        }
        .frame(width: 300, height: 34)
        .onReceive(timer) { _ in
            var delta = desiredDuration.timeIntervalSince(Date())
            if delta <= 0 {
                delta = 0
                timer.upstream.connect().cancel()
            }
            duration = DateComponentsFormatter.counterFormatter.string(from: delta) ?? "---"
        }
    }
}
