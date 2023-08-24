//
//  StatisticsPage.swift
//  IronBound
//

import SwiftUI

struct StatisticsPage: View {
    var body: some View {
        ZStack {
            Color("46748B")
            Image(systemName: "trophy.circle")
                .foregroundColor(Color.white)
                .font(.system(size: 100))
        }
    }
}

struct StatisticsPage_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsPage()
    }
}
