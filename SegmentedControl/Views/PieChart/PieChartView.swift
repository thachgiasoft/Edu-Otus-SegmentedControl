//
//  PieChartView.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 25.12.2019.
//  Copyright © 2019 exey. All rights reserved.
//

import SwiftUI

//struct PieChartView: View {
//
//    var data: [Double]
//    var backgroundColor: Color
//    var slices: [PieSliceViewModel] {
//        var tempSlices: [PieSliceViewModel] = []
//        var lastEndDeg: Double = 0
//        let maxValue = data.reduce(0, +)
//        for slice in data {
//            let normalized: Double = Double(slice) / Double(maxValue)
//            let startDeg = lastEndDeg
//            let endDeg = lastEndDeg + (normalized * 360)
//            lastEndDeg = endDeg
//            tempSlices.append(PieSliceViewModel(name: "", startDeg: startDeg, endDeg: endDeg, value: slice, normalizedValue: normalized))
//        }
//        return tempSlices
//    }
//
//    public var body: some View {
//        VStack {
//            ForEach(0..<self.slices.count) { i in
//                Spacer()
//                Text("Test")
//            }
//            Spacer()
//            GeometryReader { geometry in
//                ZStack {
//                    ForEach(0..<self.slices.count) { i in
//                        PieSliceView(rect: geometry.frame(in: .local), startDeg: self.slices[i].startDeg, endDeg: self.slices[i].endDeg, index: i, backgroundColor: self.backgroundColor, accentColor: .randomColor(for: i, maxCount: self.slices.count))
//                    }
//                }
//            }
//            Spacer()
//        }
//    }
//}


struct PieChartView: View {

    @EnvironmentObject var pieChartViewModel: PieChartViewModel
    var sliceBorderColor: Color
    var pieColors: [Color] {
        var colors = [Color]()
        for i in 0..<pieChartViewModel.slices.count {
            let color = Color.randomColor(for: i, maxCount: pieChartViewModel.slices.count)
            colors.append(color)
        }
        return colors
    }

    public var body: some View {
        VStack {
            if pieChartViewModel.isLoaded {
                Spacer()
                GeometryReader { geometry in
                    ZStack {
                        ForEach(0..<self.pieChartViewModel.slices.count) { i in
                            PieSliceView(rect: geometry.frame(in: .local),
                                         startDeg: self.pieChartViewModel.slices[i].startDeg,
                                         endDeg: self.pieChartViewModel.slices[i].endDeg,
                                         index: i, backgroundColor: self.sliceBorderColor,
                                         accentColor: self.pieColors[i])
                        }
                    }
                }
                ForEach(0..<self.pieChartViewModel.slices.count) { i in
                    Spacer()
                    HStack {
                        Rectangle().frame(width: 20, height: 20)
                            .foregroundColor(self.pieColors[i])
                        Text("Test")
                    }
                }
                Spacer()
            }
        }
    }
}


struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(sliceBorderColor: .white)
            .frame(width: 100, height: 100)
            .environmentObject(PieChartViewModel())
    }
}
