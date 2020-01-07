//
//  DateFormatter+Format.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 07.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    convenience init(format: String) {
        self.init()
        dateFormat = format
    }
    
    static let articlesDateFormatter = DateFormatter(format: "yyyy-MM-dd")
    
}
