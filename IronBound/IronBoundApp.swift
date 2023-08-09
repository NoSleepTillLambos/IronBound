//
//  IronBoundApp.swift
//  IronBound
//
//  Created by Paige Phelps on 2023/08/03.
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
