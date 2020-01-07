//
//  ArticlesAPI+Requests.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 07.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import NewsAPIClient

public typealias ArticlesAPICompletion = ((_ type: ArticleType, _ data: ArticleList?,_ error: Error?) -> Void)

extension ArticlesAPI {
    
    open class func everythingGet(with params: ArticlesParams, completion: @escaping ArticlesAPICompletion) {
        everythingGet(q: params.type.rawValue, from: params.date, sortBy: params.date, apiKey: params.apiKey) { list, error in
            completion(params.type, list, error)
        }
    }
    
}
