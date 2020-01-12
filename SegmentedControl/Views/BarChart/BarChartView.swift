//
//  BarChartRow.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 07.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI

public struct BarChartView : View {

    @EnvironmentObject var barChartViewModel: BarChartViewModel
    
    public var body: some View {
        VStack(alignment: .leading) {
            if self.barChartViewModel.isLoaded {
                Spacer()
                GeometryReader { geometry in
                    HStack(alignment: .bottom, spacing: self.barSpacing(fullWidth: geometry.frame(in: .local).width)) {
                        ForEach(0..<self.barChartViewModel.bars.count) { i in
                            BarView(value: self.barChartViewModel.bars[i].normalizedValue, index: i, cellWidth: self.cellWidth(geometry.frame(in: .local).width), accentColor: Color(colorParams: self.barChartViewModel.bars[i].colorParams))
                        }
                    }
                }
                ForEach(0..<self.barChartViewModel.bars.count) { i in
                    Spacer()
                    HStack {
                        Rectangle().frame(width: 20, height: 20)
                            .foregroundColor(Color(colorParams: self.barChartViewModel.bars[i].colorParams))
                        Text(self.barChartViewModel.bars[i].name)
                    }
                }
            }
        }.padding([.top, .leading, .trailing], 10)
    }
    
    private func cellWidth(_ width: CGFloat) -> CGFloat {
        return width / (CGFloat(barChartViewModel.bars.count) * 1.5)
    }
    
    private func barSpacing(fullWidth: CGFloat) -> CGFloat {
        fullWidth / CGFloat(self.barChartViewModel.bars.count * 3)
    }

}

struct ChartRow_Previews : PreviewProvider {
    static var previews: some View {
        BarChartView().environmentObject(BarChartViewModel())
    }
}
