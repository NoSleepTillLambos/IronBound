//
//  workoutsScreen.swift
//  IronBound
//
//  Created by Paige Phelps on 2023/08/03.
//

import SwiftUI

struct workoutsScreen: View {
    var body: some View {
        ZStack {
            Color("46748B")
            Image(systemName: "dumbbell.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 100))
        }
    }
}

struct workoutsScreen_Previews: PreviewProvider {
    static var previews: some View {
        workoutsScreen()
    }
}
