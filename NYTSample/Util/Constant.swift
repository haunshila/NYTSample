//
//  Constant.swift
//  NYTSample
//
//  Created by hauyadav on 07/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//

import Foundation
import UIKit

let SHADOW_GRY: CGFloat = 120.0 / 255.0
let API_KEY = "111a40b4db0642c2abf0c9eb194d4eba"
let ARTICLE_URL = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=\(API_KEY)"

typealias DownloadComplete = () -> ()
