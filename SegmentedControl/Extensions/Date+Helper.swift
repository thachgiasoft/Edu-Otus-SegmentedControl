//
//  Date+Helper.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 07.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation

extension Date {
    
    static let oneMonthAgo: Self? = Calendar.current.date(byAdding: .day, value: -30, to: Date())
    
}
