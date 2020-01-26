//
//  LineChartViewModel.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 26.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation

class LineChartViewModel: ObservableObject {
    
    let yAxis: [Double]
    let xAxis: [Double]
    
    init(histogram: Histogram) {
        yAxis = histogram.histogram.values.map(Double.init)
        xAxis = histogram.histogram.keys.map(Double.init) as? [Double] ?? []
    }
    
}
