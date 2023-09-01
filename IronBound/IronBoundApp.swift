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
    @StateObject var authManager = AuthManager()
    
    
    var body: some Scene {
        WindowGroup {
           
            if isOnboarding {
                OnBoardingView()
            } else {
                if (authManager.isAuthenticated) {
                    ContentView()
                          .environment(\.managedObjectContext, dataController.container.viewContext)
                } else {
                    BioAuthView()
                        .environmentObject(authManager)
                }
              
            } 
        }
    }
}
