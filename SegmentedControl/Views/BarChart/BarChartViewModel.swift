//
//  BarChartViewModel.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 12.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation
import GitHubAPIClient

final class BarChartViewModel: ObservableObject {
    
    @Published var bars = [BarViewModel]()
    @Published var isLoaded = false
    
    init() {
        fetchRepositoryData()
    }
    
    private func fetchRepositoryData() {
        let dispatchGroup = DispatchGroup()
        var repositoryDatas = [RepositoryData]()
        
        RepositoryType.allCases.forEach { type in
            dispatchGroup.enter()
            SearchAPI.searchReposGet(q: type.rawValue, order: .asc) { (repositoryList, error) in
                if error == nil {
                    repositoryDatas.append(RepositoryData(totalResults: repositoryList?.totalCount ?? 0, type: type))
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.bars = BarViewModelFactory.createBars(from: repositoryDatas)
            self.isLoaded = true
        }
    }
    
}


