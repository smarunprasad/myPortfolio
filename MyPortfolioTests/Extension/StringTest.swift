//
//  String.swift
//  MyPortfolioTests
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import MyPortfolio

class StringTest: XCTestCase {

    var string: String?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        
        string = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConvertDateFormateMethode() {
        
        string = "1977-05-25T07:00:00Z"
        let aStr = string?.convertDateFormater()
        XCTAssertNotNil(aStr, "string should not be nil")
        XCTAssertEqual(aStr, "May 25, 1977", "string should be equal to the given value")
    }
    
    func testConvertDateFormateMethodeForInvalidValue() {
        
        string = "1977-05-25"
        let aStr = string?.convertDateFormater()
        XCTAssertEqual(aStr, "", "string should be empty")
    }
    
    func testOpeniTunesMethode() {
        
        string = "+44 7733248495"
        string?.openURL { (success) in
            
            XCTAssertTrue(success, "Should return true for the given url")
        }
        
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
