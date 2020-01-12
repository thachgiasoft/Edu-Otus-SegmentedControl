//
//  BarViewModel.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 12.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation

struct BarViewModel: Identifiable {
    
    let colorParams: ColorParams
    let name: String
    var id = UUID()
    var value: Double
    var normalizedValue: Double
    
}

struct BarViewModelFactory {
    
    static func createBars(from repositoryDatas: [RepositoryData]) -> [BarViewModel] {
        let data = repositoryDatas.map { Double($0.totalResults) }
        let names = repositoryDatas.map { $0.type.rawValue }
        return createBars(from: data, dataNames: names)
    }
    
    static func createBars(from data: [Double], dataNames: [String]) -> [BarViewModel] {
        var bars: [BarViewModel] = []
        let maxValue = data.max() ?? 0
        for (index, value) in data.enumerated() {
            let normalized = value / maxValue
            let colorParams = ColorParamsFactory.create(for: index, maxCount: data.count)
            bars.append(BarViewModel(colorParams: colorParams,
                                     name: dataNames[index],
                                     value: value,
                                     normalizedValue: normalized))
        }
        return bars
    }
    
}
