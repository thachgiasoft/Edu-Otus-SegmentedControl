//
//  PieChartViewModel.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 07.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation
import NewsAPIClient

final class PieChartViewModel: ObservableObject {
    
    @Published var slices = [PieSliceViewModel]()
    @Published var isLoaded = false
    
    init() {
        fetchArticlesDatas()
    }
    
    private func fetchArticlesDatas() {
        let dispatchGroup = DispatchGroup()
        var articlesViewModels = [ArticlesData]()
        
        ArticleType.allCases.forEach { type in
            dispatchGroup.enter()
            ArticlesAPI.everythingGet(with: ArticlesParams(type: type)) { (type, list, error) in
                if error == nil {
                    articlesViewModels.append(ArticlesData(totalResults: list?.totalResults ?? 0, type: type))
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.slices = PieSliceViewModelFactory.createSlices(from: articlesViewModels)
            self.isLoaded = true
        }
    }
    
}
