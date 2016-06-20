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

    func testIntToSxg() {
        XCTAssert(NumToBase60.IntToSxg(8645997) == "f1ex")
        XCTAssert(NumToBase60.IntToSxg(1234) == "L_")
        XCTAssert(NumToBase60.IntToSxg(134634) == "cPu")
        XCTAssert(NumToBase60.IntToSxg(1) == "1")
        XCTAssert(NumToBase60.IntToSxg(1231235) == "5h0a")
    }

    func testIntToSxgF() {
        XCTAssert(NumToBase60.IntToSxgF(123, formatLength: 4) == "0023")
        XCTAssert(NumToBase60.IntToSxgF(125124) == "_kQ")
        XCTAssert(NumToBase60.IntToSxgF(13450998, formatLength: 5) == "12GPJ")
        XCTAssert(NumToBase60.IntToSxgF(1249087, formatLength: 6) == "005my7")
        XCTAssert(NumToBase60.IntToSxgF(435634567, formatLength: 10) == "00000Zbpb7")
    }

    func testSxgToInt() {
        XCTAssert(NumToBase60.SxgToInt("flex") == 8645997)
        XCTAssert(NumToBase60.SxgToInt("f1ex") == 8645997)
        XCTAssert(NumToBase60.SxgToInt("fIex") == 8645997)
        XCTAssert(NumToBase60.SxgToInt("g0xs") == 8859472)
        XCTAssert(NumToBase60.SxgToInt("gOxs") == 8859472)
        XCTAssert(NumToBase60.SxgToInt("00123") == 3723)
    }

    func testDateToSxg() {
        XCTAssert(NumToBase60.DateToSxg(NSDate(timeIntervalSinceReferenceDate: 0)) == "38i")
        XCTAssert(NumToBase60.DateToSxg(NSDate(timeIntervalSinceReferenceDate: 1234423)) == "38x")
        XCTAssert(NumToBase60.DateToSxg(NSDate(timeIntervalSince1970: 12314123)) == "2N")
        XCTAssert(NumToBase60.DateToSxg(NSDate(timeIntervalSinceReferenceDate: 999999999)) == "6Mc")
    }

    func testDateToSxgF() {
        XCTAssert(NumToBase60.DateToSxgF(NSDate(timeIntervalSinceReferenceDate: 0), formatLength: 4) == "038i")
        XCTAssert(NumToBase60.DateToSxgF(NSDate(timeIntervalSinceReferenceDate: 1234423), formatLength: 5) == "0038x")
        XCTAssert(NumToBase60.DateToSxgF(NSDate(timeIntervalSince1970: 12314123), formatLength: 0) == "2N")
        XCTAssert(NumToBase60.DateToSxgF(NSDate(timeIntervalSinceReferenceDate: 999999999)) == "6Mc")
    }

    func testSxgToDate() {
        XCTAssert(NumToBase60.SxgToDate("38i") == NSDate(timeIntervalSince1970: 978307200))
        XCTAssert(NumToBase60.SxgToDate("6Mc") == NSDate(timeIntervalSince1970: 1978300800))
        XCTAssert(NumToBase60.SxgToDate("2N") == NSDate(timeIntervalSince1970: 12268800))
        XCTAssert(NumToBase60.SxgToDate("38i") == NSDate(timeIntervalSince1970: 978307200))
    }

    func testSxgToISO() {
        print(NumToBase60.SxgToISO("38i"))
        XCTAssert(NumToBase60.SxgToISO("38i") == "2001-01-01T00:00:00Z")
        XCTAssert(NumToBase60.SxgToISO("6Mc") == "2032-09-09T00:00:00Z")
        XCTAssert(NumToBase60.SxgToISO("2N") == "1970-05-23T00:00:00Z")
        XCTAssert(NumToBase60.SxgToISO("38i") == "2001-01-01T00:00:00Z")
    }
}
