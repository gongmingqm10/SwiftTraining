//
//  CalculateMgrTests.swift
//  Calculator
//
//  Created by Ming Gong on 6/12/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import XCTest

class CalculateMgrTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
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
    
//    func testShouldTwoPlusThreeMultiThreeEqualsEleven() {
//        let calculateMgr = CalculateMgr()
//        calculateMgr.pushNumber(2)
//        calculateMgr.pushOperator("+")
//        calculateMgr.pushNumber(3)
//        calculateMgr.pushOperator("*")
//        calculateMgr.pushNumber(3)
//        
//        XCTAssertEqual(calculateMgr.calculateResult(), 11)
//    }
}
