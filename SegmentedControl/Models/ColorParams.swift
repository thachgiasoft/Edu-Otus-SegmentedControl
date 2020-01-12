//
//  ColorParams.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 12.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation

struct ColorParams {
    
    let red, green, blue: Double
    
}

struct ColorParamsFactory {
    
    static func create(for index: Int, maxCount: Int) -> ColorParams {
        let step = Double(index / maxCount)
        let reverseStep = Double((maxCount - index) / maxCount)
        return ColorParams(red: .random(in: step...1), green: .random(in: reverseStep...1), blue: .random(in: reverseStep...1))
    }
    
}
