//
//  SplashScreen.swift
//  IronBound

import SwiftUI

struct SplashScreen: View {
    
    // whether splash screen is active or not
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        ZStack {
                    if self.isActive {
                        ContentView()
                    } else {
                        Rectangle()
                            .background(Color.black)
                        Image("splashScreen")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                    }
                }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.isActive = true
                    
                }
            }
        }
        
    }


struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
