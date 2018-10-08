//
//  ArticleResponse.swift
//  NYTSample
//
//  Created by hauyadav on 08/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//

//import Foundation
//import ObjectMapper
struct ArticleResponse: Codable {
    
    var articleModelList : [ArticleModel]
    
    enum CodingKeys: String, CodingKey {
        case articleModelList = "results"

    }
}
