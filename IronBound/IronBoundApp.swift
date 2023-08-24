//
//  IronBoundApp.swift
//  IronBound
//
//

import SwiftUI

@main
struct OnBoardingViewSwiftUIApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnBoardingView()
            } else {
              ContentView()
            } 
        }
    }
}
