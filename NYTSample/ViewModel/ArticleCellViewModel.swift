//
//  ArticleCellViewModel.swift
//  NYTSample
//
//  Created by hauyadav on 08/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//

import Foundation
protocol ArticleCellViewModel {
    var articleItem: ArticleModel { get }
    var articlePublishedDate : String { get }
}

extension ArticleModel: ArticleCellViewModel {
    var articleItem: ArticleModel {
        return self
    }
    var articlePublishedDate: String {
        
        let calendar: UInt32 = 0x0001F4C5
        if let scalarValue = UnicodeScalar(calendar){
            return String(scalarValue)+" "+publishedDate
        }
        return publishedDate
    }
}
