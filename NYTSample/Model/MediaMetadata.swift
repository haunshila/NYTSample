//
//  MediaMetadata.swift
//  NYTSample
//
//  Created by hauyadav on 08/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//


struct MediaMetadata: Codable{
    
    let url: String?
    let format: String?
    let height: Int64
    let width: Int64

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }
    
}
