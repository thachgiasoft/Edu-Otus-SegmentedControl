//
//  Color+Init.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 07.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI

extension Color {
    
    static func randomColor(for index: Int, maxCount: Int) -> Self {
        let randomBlueValue = Double(index / maxCount)
        let randomBlueValue2 = Double((maxCount - index) / maxCount)
        return Color(red: .random(in: randomBlueValue...1), green: .random(in: randomBlueValue2...1), blue: .random(in: randomBlueValue2...1))
    }
    
    init(colorParams: ColorParams) {
        self = .init(red: colorParams.red, green: colorParams.green, blue: colorParams.blue)
    }
}
