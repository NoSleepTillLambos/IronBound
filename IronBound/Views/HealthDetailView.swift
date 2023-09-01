//
//  HealthDetailView.swift
//  IronBound
//
//  Created by Paige Phelps on 2023/09/01.
//

import SwiftUI

struct HealthDetailView: View {
    var activity: Activity
    var repository: HKREPO
    
    @ObservedObject var viewModel: ChartModel
    
    init(activity: Activity, repository: HKREPO) {
        self.activity = activity
        self.repository = repository
        
        
        viewModel = ChartModel(activity: activity, repository: repository)
    }
    var body: some View {
        ChartView(values: viewModel.stats.map {viewModel.value(from: $0.stat).value}, labels: viewModel.stats.map {viewModel.value(from: $0.stat).desc}, xAxisLabels: viewModel.stats.map {ChartModel.dateFormatter.string(from: $0.date)})
        
        List(viewModel.stats) {
            stat in
            VStack(alignment: .leading) {
                Text(viewModel.value(from: stat.stat).desc)
                Text(stat.date, style: .date).opacity(0.5)
            }
        }
        .navigationBarTitle("\(activity.name) \(activity.image)", displayMode: .inline)
    }
}

struct HealthDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HealthDetailView(activity: Activity(id: "Steps", name: " Steps", image: "🚶🏼‍♂️"), repository: HKREPO())
    }
}
