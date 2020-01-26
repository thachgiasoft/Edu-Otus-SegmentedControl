//
//  LegendView.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 12.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI

struct LegendView: View {
    
    @EnvironmentObject var histogramModelView: LineChartViewModel
    @Binding var frame: CGRect
    let padding: CGFloat = 3

    var stepWidth: CGFloat {
        return histogramModelView.yAxis.count < 2 ? 0 : frame.size.width / CGFloat(histogramModelView.yAxis.count - 1)
    }
    
    var stepHeight: CGFloat {
        guard let min = histogramModelView.yAxis.min(), let max = histogramModelView.yAxis.max(), min != max else { return 0 }
        let numerator = frame.size.height - padding
        let denominator = min < 0 ? max - min : max + min
        return numerator / CGFloat(denominator)
    }
    
    var min: CGFloat {
        return CGFloat(histogramModelView.yAxis.min() ?? 0)
    }
    
    var yLegend: [Double]? {
        guard let max = histogramModelView.yAxis.max(), let min = histogramModelView.yAxis.min() else { return nil }
        let step = (max - min) / 4
        return [min + step * 0, min + step * 1, min + step * 2, min + step * 3, min + step * 4]
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            ForEach((0...4), id: \.self) { height in
                HStack(alignment: .center) {
                    Text("\(self.yLegendSafe(height: height), specifier: "%.2f")").offset(x: 0, y: self.yPosition(height: height))
                        .foregroundColor(.gray)
                        .font(.caption)
                    self.line(atHeight: self.yLegendSafe(height: height), width: self.frame.width)
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 1.5, lineCap: .round, dash: [5, height == 0 ? 0 : 10]))
                        .rotationEffect(.degrees(180), anchor: .center)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .animation(.easeOut(duration: 0.2))
                        .clipped()
                }
            }
            
        }
    }
    
    func yLegendSafe(height: Int) -> CGFloat {
        guard let legend = yLegend else { return 0 }
        return CGFloat(legend[height])
    }
    
    func yPosition(height: Int) -> CGFloat {
        guard let legend = yLegend else { return 0 }
        return (self.frame.height - ((CGFloat(legend[height]) - min) * self.stepHeight)) - (self.frame.height / 2)
    }
    
    func line(atHeight: CGFloat, width: CGFloat) -> Path {
        var hLine = Path()
        hLine.move(to: CGPoint(x: 5, y: (atHeight - min) * stepHeight))
        hLine.addLine(to: CGPoint(x: width, y: (atHeight - min) * stepHeight))
        return hLine
    }
    
}

struct LegendView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ geometry in
            LegendView(frame: .constant(geometry.frame(in: .local))).environmentObject(LineChartViewModel(histogram: Histogram()))
        }.frame(width: 320, height: 200)
    }
}
