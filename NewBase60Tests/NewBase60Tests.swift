//
//  UnitTests.swift
//  UnitTests
//
//  Created by generator-swift-framework on 8/26/15.
//  Copyright © 2015 Haroen. All rights reserved.
//

import XCTest

@testable import NewBase60

class UnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInit() {
        let date = NSDate(timeIntervalSinceReferenceDate: 0)
        
        XCTAssert(NumToBase60.IntToSxg(8645997) == "f1ex")
        XCTAssert(NumToBase60.IntToSxgF(123123, formatLength: 4) == "0_C3")
        XCTAssert(NumToBase60.SxgToInt("flex") == 8645997)
        XCTAssert(NumToBase60.DateToSxg(date) == "38i")
        XCTAssert(NumToBase60.SxgToDate("38i") == date)
        
    }
}
