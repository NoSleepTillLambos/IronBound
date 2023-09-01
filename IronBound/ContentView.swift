//
//  ContentView.swift
//  IronBound
//

import SwiftUI
import HealthKit

struct ContentView: View {
    
    private var repository =  HKREPO()
    
    var item: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 120)), count: 2)
    }
    

    var body: some View {
        
        NavigationView{
            ZStack {
                Color("C9BFDF").ignoresSafeArea()
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
        
    
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
