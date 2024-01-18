//
//  duratioinFormatter+CounterFormat.swift
//  ClockTimer
//
//  Created by Shane Whitehead on 19/1/2024.
//

import Foundation

extension DateComponentsFormatter {
    static var counterFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropLeading
        return formatter
    }()
}
