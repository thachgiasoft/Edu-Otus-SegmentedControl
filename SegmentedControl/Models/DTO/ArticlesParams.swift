//
//  ArticlesParams.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 07.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation

public struct ArticlesParams {
    
    let type: ArticleType
    let date = String.oneMonthAgo
    let sortBy = "publishedAt"
    let apiKey = String.apiArticlesKey
    
}
