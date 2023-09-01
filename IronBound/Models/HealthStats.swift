//
//  HealthStats.swift
//  IronBound
//
//  Created by Paige Phelps on 2023/08/31.
//

import Foundation
import HealthKit

struct HealthStat: Identifiable {
    let id = UUID()
    let stat: HKQuantity?
    let date: Date
}
