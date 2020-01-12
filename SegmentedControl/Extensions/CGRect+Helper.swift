//
//  CGRect+Helper.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 12.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI

extension CGRect {
    
    var mid: CGPoint {
        return CGPoint(x:self.midX, y: self.midY)
    }
    
}
