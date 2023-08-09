//
//  ContentView.swift
//  IronBound
//
//  Created by Paige Phelps on 2023/08/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("C9BFDF")
            Text("home page").foregroundColor(.white)
                .font(.system(size:30))
            TabView {
                workoutsScreen()
                    .tabItem() {
                        Image(systemName: "dumbbell.fill")
                        Text("Workouts")
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
