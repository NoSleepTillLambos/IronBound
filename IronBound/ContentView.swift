//
//  ContentView.swift
//  IronBound
//

import SwiftUI
import HealthKit

struct ContentView: View {
    
    private var healthStore: HealthStore?
    @State private var steps: [Steps] = [Steps]()
    
    init() {
        healthStore = HealthStore()
    }
    
    private func updateUIWithStats( statisticsCollection: HKStatisticsCollection) {
        
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) {
            (statistics, stop)
            in
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            
            let step = Steps(count: Int(count ?? 0), date: statistics.startDate)
            steps.append(step)
        }
    }
    var body: some View {
        
        NavigationView {
            ZStack {
                List(steps, id: \.id) {
                            steps in
                    VStack(alignment: .leading){
                                Text("\(steps.count)")
                                Text(steps.date, style: .date)
                                    .opacity(0.5)
                            }
                        }
        }
            Color("C9BFDF")
            Text("home page").foregroundColor(.white)
                .font(.system(size:30))
            TabView {
                StatisticsPage()
                    .tabItem() {
                        Image(systemName: "trophy.circle")
                        Text("Statstics")
                    }
                
                workoutsScreen()
                    .tabItem() {
                        Image(systemName: "dumbbell.fill")
                        Text("Workouts")
                    }
                    
            }
            
        }
        
        .onAppear {
            if let healthStore = healthStore {
                healthStore.requestAuth {
                    success in
                    if success {
                        healthStore.calculateSteps { statisticsCollection in
                            if let statisticsCollection = statisticsCollection {
                                updateUIWithStats(statisticsCollection: statisticsCollection)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
