//
//  myCurrencyExchangeUITests.swift
//  myCurrencyExchangeUITests
//
//  Created by kazuaki matsuo on 2018/07/22.
//  Copyright © 2018 KazuCocoa. All rights reserved.
//

import XCTest

class myCurrencyExchangeUITests: UITestBase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        var theExpectation :XCTestExpectation
        theExpectation = expectation(description: "result doesn't appear")

        app.launch()

        app.textFields.firstMatch.tap()
        app.typeText("100")

        app.buttons["Convert"].tap()

        theExpectation.fulfill()

        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNotNil(self.app.staticTexts["1"])
        })
    }
}
