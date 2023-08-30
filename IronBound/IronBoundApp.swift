//
//  IronBoundApp.swift
//  IronBound
//
//

import SwiftUI

@main
struct OnBoardingViewSwiftUIApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @StateObject private var dataController = FoodDataController()
    var body: some Scene {
        WindowGroup {
           
            if isOnboarding {
                OnBoardingView()
            } else {
              ContentView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            } 
        }
    }
}
