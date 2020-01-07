//
//  StringExtension.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 07.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation

extension String {
    
    static let apiArticlesKey = "a9b0a70b40c7497fae2f6cff41567103"
    
    static var oneMonthAgo: Self {
        guard let date = Date.oneMonthAgo else { return "2019-12-10" }
        let formatter = DateFormatter.articlesDateFormatter
        let result = formatter.string(from: date)
        return result
    }
    
}
