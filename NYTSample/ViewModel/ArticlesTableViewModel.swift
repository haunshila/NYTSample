//
//  ArticlesTableViewModel.swift
//  NYTSample
//
//  Created by hauyadav on 08/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//

import Foundation
class ArticlesTableViewModel {
    
    enum ArticleTableViewCellType {
        case normal(cellViewModel: ArticleCellViewModel)
        case error(message: String)
        case empty
    }
    
    var onShowError: ((_ alert: SingleButtonAlert) -> Void)?
    let showLoadingHud: Bindable = Bindable(false)
    
    let articleCells = Bindable([ArticleTableViewCellType]())
    let appServerClient: APIClient
    
    init(appServerClient: APIClient = APIClient()) {
        self.appServerClient = appServerClient
    }
    
    func getArticles() {
        showLoadingHud.value = true
        appServerClient.getArticles(completion: { [weak self] result in
            self?.showLoadingHud.value = false
            switch result {
            case .success(let article):
                guard article.articleModelList.count > 0 else {
                    self?.articleCells.value = [.empty]
                    return
                }
                self?.articleCells.value = article.articleModelList.compactMap { .normal(cellViewModel: $0 as ArticleCellViewModel)}
            case .failure(let error):
                self?.articleCells.value = [.error(message: error?.getErrorMessage() ?? "Loading failed, check network connection")]
            }
        })
    }
    
    
}

// MARK: - APIClient.GetArticlesFailureReason
fileprivate extension APIClient.GetArticlesFailureReason {
    func getErrorMessage() -> String? {
        switch self {
        case .unAuthorized:
            return "Please login to load your articles."
        case .notFound:
            return "Could not complete request, please try again."
        }
    }
}



