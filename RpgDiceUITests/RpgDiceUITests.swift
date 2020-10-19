//
//  RpgDiceUITests.swift
//  RpgDiceUITests
//
//  Created by Henrique Abreu on 29/05/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

@testable import RpgDice
import XCTest

class RpgDiceUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testD4() throws {
        app.buttons["Dice"].tap()
        app.buttons["D4"].tap()
        let result = Int(app.staticTexts.element(matching: .any, identifier: "resultLabelId").label)
        guard let roll = result else {return}
        XCTAssertTrue(1 <= roll && roll <= 4)

    }
    
    func testD6() throws {
        app.buttons["Dice"].tap()
        app.buttons["D6"].tap()
        let result = Int(app.staticTexts.element(matching: .any, identifier: "resultLabelId").label)
        guard let roll = result else {return}
        XCTAssertTrue(1 <= roll && roll <= 6)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
