//
//  ChartModel.swift
//  IronBound
//
//  Created by Paige Phelps on 2023/09/01.
//

import Foundation
import HealthKit

final class ChartModel: ObservableObject {
    var activity: Activity
    var repository: HKREPO
    
    @Published var stats = [HealthStat]()
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter
    }()
    
    init(activity: Activity, repository: HKREPO) {
        self.activity = activity
        self.repository = repository
        repository.requestHealthStat(by: activity.id) {
            hStats in
            self.stats = hStats
        }
    }
    
    let measurementFormatter = MeasurementFormatter()
    
    func value(from stat: HKQuantity?) -> (value: Int, desc: String)
    {
        guard let stat = stat else {return (0, "")}
        
        measurementFormatter.unitStyle = .long
        
        if stat.is(compatibleWith: .kilocalorie()) {
            let value = stat.doubleValue(for: .kilocalorie())
            return (Int(value), stat.description)
        } else if stat.is(compatibleWith: .meter()) {
            let value = stat.doubleValue(for: .mile())
            let unit = Measurement(value: value, unit: UnitLength.miles)
            return (Int(value), measurementFormatter.string(from: unit))
        } else if stat.is(compatibleWith: .count()){
            let value = stat.doubleValue(for: .count())
            return (Int(value), stat.description)
        } else if stat.is(compatibleWith: .minute()) {
            let value = stat.doubleValue(for: .minute())
            return (Int(value), stat.description)
        }
        return (0, "")
    }
    
}
