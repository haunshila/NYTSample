//
//  MockArticleResponse.swift
//  NYTSampleTests
//
//  Created by hauyadav on 08/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//

import Foundation

extension ArticleResponse {
    static func with(articleModelList: [ArticleModel] = [ArticleModel.with()])
        -> ArticleResponse
    {
        return ArticleResponse(articleModelList: articleModelList)
    }
    static func noArticles(articleModelList: [ArticleModel])
        -> ArticleResponse
    {
        return ArticleResponse(articleModelList: articleModelList)
    }
}

extension ArticleModel {
    static func with(url: String = "https://www.google.com",
                        title: String = "News from In",
                        section: String = "Asia",
                        byline: String = "bylinebylinebyline",
                        abstract: String = "abstract abstract",
                        publishedDate: String = "2018-080-08",
                        source: String = "India",
                        articleID: Int64 = 123232,
                        assetId: Int64 = 2423423,
                        media: [MediaModel] = [MediaModel.with(mediaMetadata: [MediaMetadata.with()])])
        -> ArticleModel
    {
        return ArticleModel(url:url,
                            title:title,
                            section:section,
                            byline:byline,
                            abstract:abstract,
                            publishedDate:publishedDate,
                            source:source,
                            articleID:articleID,
                            assetId:assetId,
                            media: nil)
    }
}

extension MediaModel {
    static func with(type: String = "photo",
                     subtype: String = "New",
                     mediaMetadata: [MediaMetadata]) -> MediaModel
    {
        return MediaModel(type:type,
                            subtype:subtype,
                            mediaMetadata: nil)
    }
}

extension MediaMetadata {
    static func with(url: String = "photo",
                     format: String = "New",
                     height: Int64 = 320,
                     width:Int64 = 320) -> MediaMetadata
    {
        return MediaMetadata(url:url,
                            format:format,
                            height: height,
                            width:width)
    }
}
