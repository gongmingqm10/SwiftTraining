//
//  CalculateMgrTests.swift
//  Calculator
//
//  Created by Ming Gong on 6/12/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import XCTest

class CalculateMgrTests: XCTestCase {
    
    func testShouldClearNumberStack() {
        let calculateMgr = CalculateMgr()
        calculateMgr.pushNumber(1)
        calculateMgr.clear()
        XCTAssertEqual(calculateMgr.numberStack.count(), 0)
    }
    
    func testShouldClearOperatorStack() {
        let calculateMgr = CalculateMgr()
        calculateMgr.pushOperator("+")
        calculateMgr.clear()
        XCTAssertEqual(calculateMgr.operatorStack.count(), 0)
    }
    
    func testShouldResetIsOperator() {
        let calculateMgr = CalculateMgr()
        calculateMgr.pushOperator("-")
        
        XCTAssertTrue(calculateMgr.isOperator)
        
        calculateMgr.clear()
        XCTAssertFalse(calculateMgr.isOperator)
    }
    
    func testShouldOverrideLastOperator() {
        let calculateMgr = CalculateMgr()
        calculateMgr.pushOperator("+")
        calculateMgr.pushOperator("-")
        
        XCTAssertEqual(calculateMgr.operatorStack.count(), 1)
        XCTAssertEqual(calculateMgr.operatorStack.pop(), "-")
    }
    
    func testShouldTwoPlusThreeEqualsFive() {
        let calculateMgr = CalculateMgr()
        calculateMgr.pushNumber(2)
        calculateMgr.pushOperator("+")
        calculateMgr.pushNumber(3)
        
        XCTAssertEqual(calculateMgr.calculateResult(), 5)
    }
    
    func testShouldTwoPlusThreeMultiThreeEqualsEleven() {
        let calculateMgr = CalculateMgr()
        calculateMgr.pushNumber(2)
        calculateMgr.pushOperator("+")
        calculateMgr.pushNumber(3)
        calculateMgr.pushOperator("*")
        calculateMgr.pushNumber(3)
        
        XCTAssertEqual(calculateMgr.calculateResult(), 11)
    }
    
    func testShouldSixMinusThreePlusEightEqualsEleven() {
        let calculateMgr = CalculateMgr()
        calculateMgr.pushNumber(6)
        calculateMgr.pushOperator("-")
        calculateMgr.pushNumber(3)
        calculateMgr.pushOperator("+")
        calculateMgr.pushNumber(8)
        
        XCTAssertEqual(calculateMgr.calculateResult(), 11)
    }
    
    func testShouldSixDivideTwoMultiTwoEqualsSix() {
        let calculateMgr = CalculateMgr()
        calculateMgr.pushNumber(6)
        calculateMgr.pushOperator("/")
        calculateMgr.pushNumber(2)
        calculateMgr.pushOperator("*")
        calculateMgr.pushNumber(2)
        
        XCTAssertEqual(calculateMgr.calculateResult(), 6)
    }
}
