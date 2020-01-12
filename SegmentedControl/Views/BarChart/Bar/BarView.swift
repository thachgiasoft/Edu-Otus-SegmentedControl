//
//  BarChartCell.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 07.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI

public struct BarView : View {
    
    var value: Double
    var index: Int = 0
    var cellWidth: CGFloat
    var accentColor: Color
    @State var scaleValue: Double = 0
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(accentColor)
            }
            .frame(width: CGFloat(self.cellWidth))
            .scaleEffect(CGSize(width: 1, height: self.scaleValue), anchor: .bottom)
            .onAppear(){
                self.scaleValue = self.value
            }
        .animation(Animation.spring().delay(Double(self.index) * 0.04))
    }
    
}

struct ChartCell_Previews : PreviewProvider {
    static var previews: some View {
        BarView(value: 0.75, cellWidth: 50, accentColor: .red)
    }
}
