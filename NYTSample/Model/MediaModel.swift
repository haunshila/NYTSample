//
//  MediaModel.swift
//  NYTSample
//
//  Created by hauyadav on 08/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//

import Foundation

struct MediaModel: Codable{
 
    let type: String
    let subtype: String?
    let mediaMetadata: [MediaMetadata]?
    
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case subtype = "subtype"
        case mediaMetadata = "media-metadata"
    }
    
}
