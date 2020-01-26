//
//  Path+Helper.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 26.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI

extension Path {
    
    static func quadCurvedPathWithPoints(points: [Double], step: CGPoint) -> Path {
        var path = Path()
        guard points.count > 1, var offset = points.min() else { return path }
        offset -= 0.5
        var p1 = CGPoint(x: 0, y: CGFloat(points[0] - offset) * step.y)
        path.move(to: p1)
        for pointIndex in 1..<points.count {
            let p2 = CGPoint(x: step.x * CGFloat(pointIndex), y: step.y * CGFloat(points[pointIndex] - offset))
            let midPoint = p1.midPoint(with: p2)
            path.addQuadCurve(to: midPoint, control: midPoint.controlPoint(with: p1))
            path.addQuadCurve(to: p2, control: midPoint.controlPoint(with: p2))
            p1 = p2
        }
        return path
    }
    
}
