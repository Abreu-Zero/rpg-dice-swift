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

    func testD4(){
        app.buttons["Dice"].tap()
        app.buttons["D4"].tap()
        let result = Int(app.staticTexts.element(matching: .any, identifier: "resultLabelId").label)
        guard let roll = result else {return}
        XCTAssertTrue(1 <= roll && roll <= 4)

    }
    
    func testD6(){
        app.buttons["Dice"].tap()
        app.buttons["D6"].tap()
        let result = Int(app.staticTexts.element(matching: .any, identifier: "resultLabelId").label)
        guard let roll = result else {return}
        XCTAssertTrue(1 <= roll && roll <= 6)
    }
    
    func testD8(){
        app.buttons["Dice"].tap()
        app.buttons["D8"].tap()
        let result = Int(app.staticTexts.element(matching: .any, identifier: "resultLabelId").label)
        guard let roll = result else {return}
        XCTAssertTrue(1 <= roll && roll <= 8)
    }
    
    func testD10(){
        app.buttons["Dice"].tap()
        app.buttons["D10"].tap()
        let result = Int(app.staticTexts.element(matching: .any, identifier: "resultLabelId").label)
        guard let roll = result else {return}
        XCTAssertTrue(1 <= roll && roll <= 10)
    }
    
    func testD12(){
        app.buttons["Dice"].tap()
        app.buttons["D12"].tap()
        let result = Int(app.staticTexts.element(matching: .any, identifier: "resultLabelId").label)
        guard let roll = result else {return}
        XCTAssertTrue(1 <= roll && roll <= 12)
    }
    
    func testD20(){
        app.buttons["Dice"].tap()
        app.buttons["D20"].tap()
        let result = Int(app.staticTexts.element(matching: .any, identifier: "resultLabelId").label)
        guard let roll = result else {return}
        XCTAssertTrue(1 <= roll && roll <= 20)
    }
    
    func testGoToHistory(){
        app.buttons["Dice"].tap()
        app.buttons["History"].tap()
        XCUIApplication().navigationBars["RpgDice.HistoryView"].buttons["Dice"].tap()
        XCTAssertTrue(app.buttons["History"].exists)
        
    }
    
    func testLibraryWorks(){
        app.buttons["Library"].tap()
        app.pickerWheels["Abilities"].tap()
        let tablesQuery = app.tables
        var count = tablesQuery.cells.count
        XCTAssert(count > 0)
        app.pickerWheels["Abilities"].adjust(toPickerWheelValue: "Classes")
        count = tablesQuery.cells.count
        XCTAssert(count > 0)
        app.pickerWheels["Classes"].adjust(toPickerWheelValue: "Equipment")
        sleep(3)
        count = tablesQuery.cells.count
        XCTAssert(count > 0)
        app.pickerWheels["Equipment"].adjust(toPickerWheelValue: "Monsters")
        sleep(3)
        count = tablesQuery.cells.count
        XCTAssert(count > 0)
        app.pickerWheels["Monsters"].adjust(toPickerWheelValue: "Races")
        sleep(3)
        count = tablesQuery.cells.count
        XCTAssert(count > 0)
        app.pickerWheels["Races"].adjust(toPickerWheelValue: "Spells")
        sleep(3)
        count = tablesQuery.cells.count
        XCTAssert(count > 0)
    }
    
    func testAbilitiesWork(){
        app.buttons["Library"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["CHA"]/*[[".cells.staticTexts[\"CHA\"]",".staticTexts[\"CHA\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "abilityNameLabel").label, "Charisma")
    }
    
    func testClassesWork(){
        app.buttons["Library"].tap()
        app.pickerWheels["Abilities"].adjust(toPickerWheelValue: "Classes")
        app.tables.staticTexts["Wizard"].tap()
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "classNameLabel").label, "Wizard")
    }
    
    func testEquipmentWork(){
        app.buttons["Library"].tap()
        app.pickerWheels["Abilities"].adjust(toPickerWheelValue: "Equipment")
        sleep(3)
        XCTAssert(app.tables.staticTexts["Ammunition"].exists)
    }
    
    func testArmorWork(){
        app.buttons["Library"].tap()
        app.pickerWheels["Abilities"].adjust(toPickerWheelValue: "Equipment")
        sleep(3)
        app.tables.staticTexts["Armor"].tap()
        
        var name = app.staticTexts.element(matching: .any, identifier: "equipNameLabel").label
        XCTAssertEqual(name, "Name: Padded")
        
        app.pickerWheels["Padded"].adjust(toPickerWheelValue: "Spellguard Shield")
        sleep(3)
        name = app.staticTexts.element(matching: .any, identifier: "equipNameLabel").label
        XCTAssertEqual(name, "Name: Spellguard Shield")
    }
    
    func testMonstersWork(){ //monsterNameLabel
        app.buttons["Library"].tap()
        app.pickerWheels["Abilities"].adjust(toPickerWheelValue: "Monsters")
        
        app.tables.staticTexts["Aboleth"].tap()
        var name = app.staticTexts.element(matching: .any, identifier: "monsterNameLabel").label
        XCTAssertEqual(name, "\nName: Aboleth")
        
        XCUIApplication().navigationBars["RpgDice.MonstersBookView"].buttons["Library"].tap()
        
        app.tables.staticTexts["Zombie"].tap()
        name = app.staticTexts.element(matching: .any, identifier: "monsterNameLabel").label
        XCTAssertEqual(name, "\nName: Zombie")
    }
    
    func testRacesWork(){
        app.buttons["Library"].tap()
        app.pickerWheels["Abilities"].adjust(toPickerWheelValue: "Races")
        app.tables.staticTexts["Dragonborn"].tap()
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "racesNameLabel").label, "Dragonborn")
    }
    
    func testSpellsWork(){
        app.buttons["Library"].tap()
        app.pickerWheels["Abilities"].adjust(toPickerWheelValue: "Spells")
        app.tables.staticTexts["Zone of Truth"].tap()
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "spellNameLabel").label, "\nZone of Truth")
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
