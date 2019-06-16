//
//  ProjectsViewModelTest.swift
//  MyPortfolioTests
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import MyPortfolio

class ProjectsViewModelTest: XCTestCase {

    var viewModel: ProjectViewModel!
    override func setUp() {
        
        viewModel = ProjectViewModel.init()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        
        viewModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testloadDataMethode() {
        
        let expectation = XCTestExpectation(description: "testloadDataMethode")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
            
            XCTAssertNotNil(self.viewModel.projectsContant, "projectsContant should not be nil")
            XCTAssertNotNil(self.viewModel.projectsContant.projects, "projects should not be nil")
            XCTAssertGreaterThan(self.viewModel.projectsContant.projects?.count ?? 0, 0, "projects.count should be greater than 0")
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 30)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
