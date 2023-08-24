//
//  StepGraph.swift
//  IronBound
//
//  Created by Paige Phelps on 2023/08/17.
//

import SwiftUI

struct StepGraph: View {
    // formatting dates to month and day
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
    }()
    
    let steps: [Steps]
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            ForEach(steps, id: \.id) { step in
                
                let yval = Swift.min(step.count/20, 300)
                VStack
                {
                    Text("\(step.count)").foregroundColor(Color.white)
                    Rectangle()
                        .fill(Color("Light"))
                        .cornerRadius(16)
                        .frame(width: 20, height: CGFloat(yval))
                    Text("\(step.date, formatter: Self.dateFormatter)")
                        .font(.caption)
                        .foregroundColor(Color.white)
                }
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 500)
        .background(Color("BlueDark"))
        .cornerRadius(16)
        .padding(40)
    }
}

struct StepGraph_Previews: PreviewProvider {
    static var previews: some View {
        let steps = [
        Steps(count: 3444, date: Date()),
        Steps(count: 390, date: Date()),
        Steps(count: 2000, date: Date()),
        Steps(count: 15000, date: Date())
        ]
        StepGraph(steps: steps)
    }
}
