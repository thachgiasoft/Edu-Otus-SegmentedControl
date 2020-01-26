//
//  LineChartView.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 12.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI

struct LineChartView: View {
    
    @EnvironmentObject var histogramModelView: LineChartViewModel    
    @State private var showLegend = false
    
    public var body: some View {
        GeometryReader{ geometry in
            VStack(alignment: .leading, spacing: 8) {
                GeometryReader { reader in
                    if (self.showLegend) {
                        LegendView(frame: .constant(reader.frame(in: .local))).environmentObject(self.histogramModelView)
                            .transition(.opacity)
                            .animation(Animation.easeOut(duration: 1).delay(1))
                    }
                    LineView(frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width - 30, height: reader.frame(in: .local).height))).environmentObject(self.histogramModelView).offset(x: 30, y: 0)
                        .onAppear() {
                            self.showLegend.toggle()
                    }
                }.frame(width: geometry.frame(in: .local).size.width, height: 240).offset(x: 0, y: 40 )
            }
        }
    }
    
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView().environmentObject(LineChartViewModel(histogram: Histogram()))
    }
}
