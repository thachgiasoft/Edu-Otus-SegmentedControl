//
//  CGPoint+Helper.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 26.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import UIKit

extension CGPoint {
    
    func dist(to: Self) -> CGFloat {
        return sqrt((pow(x - to.x, 2) + pow(y - to.y, 2)))
    }
    
    func midPoint(with secondPoint: Self) -> Self {
        return Self(x: (x + secondPoint.x) / 2, y: (y + secondPoint.y) / 2)
    }
    
    func controlPoint(with secondPoint: Self) -> Self {
        var controlPoint = midPoint(with: secondPoint)
        let diffY = abs(y - controlPoint.y)
        if (y < secondPoint.y) {
            controlPoint.y += diffY
        } else if (y > secondPoint.y) {
            controlPoint.y -= diffY
        }
        return controlPoint
    }
    
}
