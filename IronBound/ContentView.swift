//
//  ContentView.swift
//  IronBound
//

import SwiftUI
import HealthKit

struct ContentView: View {
    

    var body: some View {
        
        
            ZStack {
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
                            Image(systemName: "heart.circle")
                            Text("Meal Prep")
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
