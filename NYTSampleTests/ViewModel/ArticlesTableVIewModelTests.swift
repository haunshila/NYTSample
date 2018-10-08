//
//  ArticlesTableVIewModelTests.swift
//  NYTSampleTests
//
//  Created by hauyadav on 08/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//

import XCTest

class ArticlesTableVIewModelTests: XCTestCase{
    
    // MARK: - getArticles
    func testNormalArticleCells() {
        let appServerClient = MockAppServerClient()
        appServerClient.getArticlesResult = .success(payload: ArticleResponse.with())
        
        let viewModel = ArticlesTableViewModel(appServerClient: appServerClient)
        viewModel.getArticles()
        
        guard case .some(.normal(_)) = viewModel.articleCells.value.first else {
            XCTFail()
            return
        }
    }
    
    func testEmptyArticleCells() {
        let appServerClient = MockAppServerClient()
        appServerClient.getArticlesResult = .success(payload:ArticleResponse.noArticles(articleModelList: []))
        
        let viewModel = ArticlesTableViewModel(appServerClient: appServerClient)
        viewModel.getArticles()
        
        guard case .some(.empty) = viewModel.articleCells.value.first else {
            XCTFail()
            return
        }
    }
    
    func testErrorArticleCells() {
        let appServerClient = MockAppServerClient()
        appServerClient.getArticlesResult = .failure(APIClient.GetArticlesFailureReason.notFound)
        
        let viewModel = ArticlesTableViewModel(appServerClient: appServerClient)
        viewModel.getArticles()
        
        guard case .some(.error(_)) = viewModel.articleCells.value.first else {
            XCTFail()
            return
        }
    }

}

private final class MockAppServerClient: APIClient {
    var getArticlesResult: APIClient.GetArticlesResult?
    
    override func getArticles(completion: @escaping APIClient.GetArticlesCompletion) {
        completion(getArticlesResult!)
    }
    
}
