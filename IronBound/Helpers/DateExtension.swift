//
//  DateExtension.swift
//  IronBound
//
//  Created by Paige Phelps on 2023/08/31.
//

import Foundation

extension Date {
    static func firstDayOfWeek() -> Date {
        return Calendar(identifier: .iso8601).date(from: Calendar(identifier: .iso8601).dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())) ?? Date()
    }
}
