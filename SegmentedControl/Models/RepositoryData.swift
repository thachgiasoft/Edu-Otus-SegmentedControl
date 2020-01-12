//
//  RepositoryData.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 12.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation

public enum RepositoryType: String, CaseIterable {
    
    case swift, kotlin
    case objc = "objective-c"
    
}

struct RepositoryData {
    
    let totalResults: Int
    let type: RepositoryType
    
}
