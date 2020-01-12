//
//  PieSliceViewModel.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 07.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation

struct PieSliceViewModel: Identifiable {
    
    let colorParams: ColorParams
    let name: String
    var id = UUID()
    var startDeg: Double
    var endDeg: Double
    var value: Double
    var normalizedValue: Double
    
}

struct PieSliceViewModelFactory {
    
    static func createSlices(from articlesDatas: [ArticlesData]) -> [PieSliceViewModel] {
        let data = articlesDatas.map { Double($0.totalResults) }
        let names = articlesDatas.map { $0.type.rawValue }
        return createSlices(from: data, dataNames: names)
    }
    
    static func createSlices(from data: [Double], dataNames: [String]) -> [PieSliceViewModel] {
        var slices: [PieSliceViewModel] = []
        var lastEndDeg: Double = 0
        let maxValue = data.reduce(0, +)
        for (index, slice) in data.enumerated() {
            let normalized: Double = Double(slice) / Double(maxValue)
            let startDeg = lastEndDeg
            let endDeg = lastEndDeg + (normalized * 360)
            lastEndDeg = endDeg
            let colorParams = ColorParamsFactory.create(for: index, maxCount: data.count)
            slices.append(PieSliceViewModel(colorParams: colorParams,
                                            name: dataNames[index],
                                            startDeg: startDeg,
                                            endDeg: endDeg,
                                            value: slice,
                                            normalizedValue: normalized))
        }
        return slices
    }
    
}
