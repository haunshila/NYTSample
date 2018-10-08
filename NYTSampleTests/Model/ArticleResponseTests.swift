//
//  ArticleResponseTests.swift
//  NYTSampleTests
//
//  Created by hauyadav on 08/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//

import XCTest

class ArticleResponseTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testSuccessfulInit() {
        let testSuccessfulJSON: JSON = ["results":[["url": "https://www.nytimes.com/interactive/2018/10/02/us/politics/donald-trump-tax-schemes-fred-trump.html",
                                                   "section":"U.S.",
                                                   "byline":"By DAVID BARSTOW, SUSANNE CRAIG and RUSS BUETTNER",
                                                   "type":"Interactive",
                                                   "title":"Trump Engaged in Suspect Tax Schemes as He Reaped Riches From His Father",
                                                   "abstract":"The president has long sold himself as a self-made billionaire.",
                                                   "published_date":"2018-10-02",
                                                   "source":"The New York Times",
                                                   "id":100000006140728,
                                                   "asset_id":100000006140728,
                                                   "media":[
                                                    [
                                                        "type":"image",
                                                        "subtype":"photo",
                                                        "caption":"",
                                                        "copyright":"Jeffery A. Salter The New York Times",
                                                        "approved_for_syndication":1,
                                                        "media-metadata":[
                                                                [
                                                                "url":"https://static01.nyt.com/images/2018/10/07/us/fred-trump-inv-promo-image/fred-trump-inv-promo-image-square320.jpg",
                                                                "format":"square320",
                                                                "height":320,
                                                                "width":320
                                                                ]
                                                            ]
                                                    ]
                                                ]
                ]
            ]
        ]
        
        
        XCTAssertNotNil(ArticleResponse(json: testSuccessfulJSON))
    }
}
// Mark: - extension ArticleResponse
private extension ArticleResponse {
    init?(json: JSON) {
        do {
            //Convert to Data
            let jsonData = try JSONSerialization.data(withJSONObject: json["results"] ?? "", options: JSONSerialization.WritingOptions.prettyPrinted)
            
            //Convert back to ArticleResponse. Usually only do this for debugging
            
            let articles = try JSONDecoder().decode([ArticleModel].self, from: jsonData)

            self.articleModelList = articles

        } catch {
            print(error)
            return nil
        }
    }
}

