//
//  APIClient.swift
//  NYTSample
//
//  Created by hauyadav on 07/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//

import Foundation
import Alamofire


// this API Clicent will be called by the viewModel to get articles.
class APIClient{

    // MARK: - GetArticles
    enum GetArticlesFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    typealias GetArticlesResult = Result<ArticleResponse, GetArticlesFailureReason>
    typealias GetArticlesCompletion = (_ result: GetArticlesResult) -> Void
    
    func getArticles(completion: @escaping GetArticlesCompletion) {
        Alamofire.request(ARTICLE_URL)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        guard let data = response.data else {
                            completion(.failure(nil))
                            return
                        }
                        
                        let articles = try JSONDecoder().decode(ArticleResponse.self, from: data)
                        completion(.success(payload: articles))
                    } catch {
                        completion(.failure(nil))
                    }
                case .failure(_):
                    if let statusCode = response.response?.statusCode,
                        let reason = GetArticlesFailureReason(rawValue: statusCode) {
                        completion(.failure(reason))
                    }
                    completion(.failure(nil))
                }
        }
    }
}
