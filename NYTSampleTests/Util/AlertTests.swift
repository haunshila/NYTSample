//
//  AlertTests.swift
//  NYTSampleTests
//
//  Created by hauyadav on 08/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//

import XCTest

class AlertTests: XCTestCase {
    
    func testAlert() {
        let expectAlertActionHandlerCall = expectation(description: "Alert action handler called")
        
        let alert = SingleButtonAlert(
            title: "",
            message: "",
            action: AlertAction(buttonTitle: "", handler: {
                expectAlertActionHandlerCall.fulfill()
            })
        )
        
        alert.action.handler!()
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
}
