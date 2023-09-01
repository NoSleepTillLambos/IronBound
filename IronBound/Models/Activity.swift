//
//  Activity.swift
//  IronBound
//
//  Created by Paige Phelps on 2023/08/31.
//

import Foundation

struct Activity: Identifiable {
    var id: String
    var name: String
    var image: String
    
    static func allActivities() -> [Activity] {
        return [
            Activity(id: "activeEnergyBurned", name: "Calories Burned", image: "⛹🏼"),
            Activity(id: "stepCount", name: "Step Count", image: "🚶🏼‍♂️")
        ]
    }
}
