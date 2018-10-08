//
//  ArticleModel.swift
//  NYTSample
//
//  Created by hauyadav on 08/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//

struct ArticleModel: Codable {
    let url: String
    let title: String
    let section: String
    let byline: String
    let abstract: String
    let publishedDate: String
    let source: String
    let articleID: Int64
    let assetId: Int64
    let media: [MediaModel]?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case title = "title"
        case section = "section"
        case byline = "byline"
        case abstract = "abstract"
        case publishedDate = "published_date"
        case source = "source"
        case articleID = "id"
        case assetId = "asset_id"
        case media = "media"
    }
}
