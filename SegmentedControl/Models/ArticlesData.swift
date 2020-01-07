//
//  ArticlesData.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 07.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation

public enum ArticleType: String, CaseIterable {
    
    case bitcoin, nginx, apple
    
}

struct ArticlesData {
    
    let totalResults: Int
    let type: ArticleType
    
}
