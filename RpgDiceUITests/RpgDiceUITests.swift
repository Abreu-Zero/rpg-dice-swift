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
    
    func testD8() throws {
        app.buttons["Dice"].tap()
        app.buttons["D8"].tap()
        let result = Int(app.staticTexts.element(matching: .any, identifier: "resultLabelId").label)
        guard let roll = result else {return}
        XCTAssertTrue(1 <= roll && roll <= 8)
    }
    
    func testD10() throws {
        app.buttons["Dice"].tap()
        app.buttons["D10"].tap()
        let result = Int(app.staticTexts.element(matching: .any, identifier: "resultLabelId").label)
        guard let roll = result else {return}
        XCTAssertTrue(1 <= roll && roll <= 10)
    }
    
    func testD12() throws {
        app.buttons["Dice"].tap()
        app.buttons["D12"].tap()
        let result = Int(app.staticTexts.element(matching: .any, identifier: "resultLabelId").label)
        guard let roll = result else {return}
        XCTAssertTrue(1 <= roll && roll <= 12)
    }
    
    func testD20() throws {
        app.buttons["Dice"].tap()
        app.buttons["D20"].tap()
        let result = Int(app.staticTexts.element(matching: .any, identifier: "resultLabelId").label)
        guard let roll = result else {return}
        XCTAssertTrue(1 <= roll && roll <= 20)
    }
    
    func testGoToHistory() throws{
        app.buttons["Dice"].tap()
        app.buttons["History"].tap()
        XCUIApplication().navigationBars["RpgDice.HistoryView"].buttons["Dice"].tap()
        XCTAssertTrue(app.buttons["History"].exists)
        
    }
    
    func testLibraryWorks() throws {
        app.buttons["Library"].tap()
        XCUIApplication().pickerWheels["Abilities"].tap()
        let tablesQuery = app.tables
        var count = tablesQuery.cells.count
        XCTAssert(count > 0)
        XCUIApplication().pickerWheels["Abilities"].adjust(toPickerWheelValue: "Classes")
        count = tablesQuery.cells.count
        XCTAssert(count > 0)
        XCUIApplication().pickerWheels["Classes"].adjust(toPickerWheelValue: "Equipment")
        count = tablesQuery.cells.count
        XCTAssert(count > 0)
        XCUIApplication().pickerWheels["Equipment"].adjust(toPickerWheelValue: "Monsters")
        count = tablesQuery.cells.count
        XCTAssert(count > 0)
        XCUIApplication().pickerWheels["Monsters"].adjust(toPickerWheelValue: "Races")
        count = tablesQuery.cells.count
        XCTAssert(count > 0)
        XCUIApplication().pickerWheels["Races"].adjust(toPickerWheelValue: "Spells")
        count = tablesQuery.cells.count
        XCTAssert(count > 0)
        
        
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
