//
//  ChartView.swift
//  IronBound
//
//  Created by Paige Phelps on 2023/08/31.
//

import SwiftUI

struct ChartView: View {
    
    let values: [Int]
    let labels: [String]
    let xAxisLabels: [String]
    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .bottom) {
                ForEach(0..<values.count) {
                    idx in
                    let max = values.max() ?? 0
                    
                    VStack {
                        Text(labels[idx])
                            .font(.caption)
                            
                        RoundedRectangle(cornerRadius: 5).fill(Color("BlueDark"))
                            .frame(width: 30, height:  CGFloat(values[idx]) / CGFloat(max) *
                                   geo.size.height * 0.6).padding()
                        
                        Text(xAxisLabels[idx])
                            .font(.caption)
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white.opacity(0.4))
                
        }
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        let values = [23, 48, 90,300, 4000]
        let labels = ["23", "48", "90", "300", "4000"]
        let xAxisLables = ["30", "31", "1", "2", "3"]
        
        ChartView(values: values, labels: labels, xAxisLabels: xAxisLables)
    }
}
