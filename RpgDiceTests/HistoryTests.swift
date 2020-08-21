//
//  HistoryTests.swift
//  RpgDiceTests
//
//  Created by Henrique Abreu on 17/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

@testable import RpgDice
import XCTest
import CoreData

class HistoryTests: XCTestCase {
    
    override func setUp(){
        super.setUp()
        
    }
    
    func testFormatDate(){
        let calendar = Calendar.current
        var components = DateComponents()

        components.day = 1
        components.month = 1
        components.year = 2020
        components.hour = 2
        components.minute = 15

        let newDate = calendar.date(from: components)
        
        let history = HistoryViewController()
        let dateString = "2020-01-01 02:15:00"
        
        XCTAssertTrue(history.formatDate(date: newDate!) == dateString)
    }
    
    func testLoadPreviousResults(){
        let history = HistoryViewController()
        XCTAssertNil(history.previousResults)
        history.dataController = DataController(modelName: "RpgDice")
        history.dataController!.load()
        XCTAssertNotNil(history.dataController)
        history.loadPreviousResults()
        XCTAssertNotNil(history.previousResults)
    }
    
    func testDeleteHistory(){
        let history = HistoryViewController()
        history.dataController = DataController(modelName: "RpgDice")
        history.dataController!.load()
        history.loadPreviousResults()
        let newRoll = RpgDice.Roll()
        history.previousResults!.append(newRoll)
        XCTAssertTrue(history.previousResults!.count > 0)
        history.nowReallyDeleteHistory()
        XCTAssertTrue(history.previousResults!.count == 0)
    }
    
    
}
