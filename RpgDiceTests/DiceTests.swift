//
//  DiceTests.swift
//  RpgDiceTests
//
//  Created by Henrique Abreu on 17/08/2020.
//  Copyright © 2020 Henrique Abreu. All rights reserved.
//

@testable import RpgDice
import XCTest

class DiceTests: XCTestCase {

    
    override func setUp() {
        super.setUp()
    }
    
    let min = 1
    let dice = DicesViewController()
    
    func testD4(){
        let max = 4
        let result = dice.rollDice(dice: 4)
        XCTAssertTrue(min <= result && result <= max)
    }
    
    func testD6(){
        let max = 6
        let result = dice.rollDice(dice: 6)
        XCTAssertTrue(min <= result && result <= max)
    }
    
    func testD8(){
        let max = 8
        let result = dice.rollDice(dice: 8)
        XCTAssertTrue(min <= result && result <= max)
    }
    
    func testD10(){
        let max = 10
        let result = dice.rollDice(dice: 10)
        XCTAssertTrue(min <= result && result <= max)
    }
    
    func testD12(){
        let max = 12
        let result = dice.rollDice(dice: 12)
        XCTAssertTrue(min <= result && result <= max)
    }
    
    func testD20(){
        let max = 20
        let result = dice.rollDice(dice: 20)
        XCTAssertTrue(min <= result && result <= max)
    }

   

}
