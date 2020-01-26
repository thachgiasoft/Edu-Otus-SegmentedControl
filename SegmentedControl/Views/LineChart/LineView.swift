//
//  LineView.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 12.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI

struct LineView: View {
    
    @EnvironmentObject var histogramModelView: LineChartViewModel
    @Binding var frame: CGRect
    @State private var showFull: Bool = false
    let padding: CGFloat = 3
    
    var stepWidth: CGFloat {
        return histogramModelView.yAxis.count < 2 ? 0 : frame.size.width / CGFloat(histogramModelView.yAxis.count - 1)
    }
    
    var stepHeight: CGFloat {
        if let min = histogramModelView.yAxis.min(), let max = histogramModelView.yAxis.max(), min != max {
            let numerator = frame.size.height - padding
            let denominator = min < 0 ? max - min : max + min
            return numerator / CGFloat(denominator)
        }
        return 0
    }
    
    var path: Path {
        return Path.quadCurvedPathWithPoints(points: histogramModelView.yAxis, step: CGPoint(x: stepWidth, y: stepHeight))
    }
    
    var body: some View {
        ZStack {
            self.path
                .trim(from: 0, to: self.showFull ? 1 : 0)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing) ,style: StrokeStyle(lineWidth: 3))
                .rotationEffect(.degrees(180), anchor: .center)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .animation(.easeOut(duration: 1.2))
                .onAppear() {
                    self.showFull.toggle()
            }.drawingGroup()
        }
    }
    
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ geometry in
            LineView(frame: .constant(geometry.frame(in: .local))).environmentObject(LineChartViewModel(histogram: Histogram()))
        }.frame(width: 320, height: 160)
    }
}

//[1, 0, 1, 4, 0, 2, 1, 1, 4, 3, 4, 7, 3, 10, 9, 12, 6, 6, 9, 8, 12, 13, 9, 19, 11, 14, 38, 33, 29, 12, 8, 1, 1]
