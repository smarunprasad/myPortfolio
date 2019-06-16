//
//  APIManagerTest.swift
//  MyPortfolioTests
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

@testable import MyPortfolio
import XCTest

class APIManagerTest: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNetworkConnect() {
        
        if APIManager.isConnectedToNetwork() == true {
            XCTAssertTrue( APIManager.isConnectedToNetwork(), "isConnectedToNetwork should be true ")
        }
        else {
            XCTAssertFalse( APIManager.isConnectedToNetwork(), "isConnectedToNetwork should be false")
        }
    }
    
    func testgetProfessionalSummeryDataForValidValue() {
        
        let expectation = XCTestExpectation(description: "testgetProfessionalSummeryDataForValidValue")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
            
            APIManager.getProfessionalSummeryData { (success, result) in
                
                switch result {
                case .success(let response):
                    
                    XCTAssertNotNil(response, "response should not be nil")
                    XCTAssertNotNil(response.professionalSummery, "professionalSummery should not be nil")
                    
                case .failure(_): break
                }
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
        
    }
    
    func testgetExperienceSummeryDataForValidValue() {
        
        let expectation = XCTestExpectation(description: "testgetProfessionalSummeryDataForValidValue")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
            
            APIManager.getExperienceSummeryData { (success, result) in
                
                switch result {
                case .success(let response):
                    
                    XCTAssertNotNil(response, "response should not be nil")
                    XCTAssertNotNil(response.experienceSummery, "experienceSummery should not be nil")
                    
                case .failure(_): break
                }
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
        
    }
    
    func testgetSkillsDataForValidValue() {
        
        let expectation = XCTestExpectation(description: "testgetProfessionalSummeryDataForValidValue")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
            
            APIManager.getSkillsData { (success, result) in
                
                switch result {
                case .success(let response):
                    
                    XCTAssertNotNil(response, "response should not be nil")
                    XCTAssertNotNil(response.skills, "skills should not be nil")
                    
                case .failure(_): break
                }
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
    }
    
    func testgetProjectsDataForValidValue() {
        
        let expectation = XCTestExpectation(description: "testgetProfessionalSummeryDataForValidValue")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
            
            APIManager.getProjectsData { (success, result) in
                
                switch result {
                case .success(let response):
                    
                    XCTAssertNotNil(response, "response should not be nil")
                    XCTAssertNotNil(response.projects, "projects should not be nil")
                    XCTAssertGreaterThan(response.projects?.count ?? 0, 0,  "projects count should be greater than 0")
                    
                case .failure(_): break
                }
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
    }
    
    func testgetEducationDataForValidValue() {
        
        let expectation = XCTestExpectation(description: "testgetProfessionalSummeryDataForValidValue")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
            
            APIManager.getEducationData { (success, result) in
                
                switch result {
                case .success(let response):
                    
                    XCTAssertNotNil(response, "response should not be nil")
                    XCTAssertNotNil(response.education, "education should not be nil")
                    XCTAssertNotNil(response.certificate, "certificate should not be nil")
                    XCTAssertNotNil(response.Summery, "Summery should not be nil")
                    
                case .failure(_): break
                }
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
