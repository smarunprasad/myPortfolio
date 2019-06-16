//
//  ColorTest.swift
//  MyPortfolioTests
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import MyPortfolio

class ColorTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHexaColorForSixDigits() {
        
        let color = UIColor.getColorFromHexa(aValue: "000000")
        XCTAssertNotNil(color, "aColor should not be nil")
    }
    
    func testHexaColorForEioghtDigits() {
        
        let color = UIColor.getColorFromHexa(aValue: "000000FF")
        
        XCTAssertNotNil(color, "aColor should not be nil")
    }
    
    func testHexaColorForEmptyValue() {
        
        let color = UIColor.getColorFromHexa(aValue: "")
        XCTAssertNotNil(color, "aColor should be nil")
    }
    
    func testPrimaryColor() {
        
        let color = UIColor.primaryColor()
        XCTAssertNotNil(color, "aColor should not be nil")
        
    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
