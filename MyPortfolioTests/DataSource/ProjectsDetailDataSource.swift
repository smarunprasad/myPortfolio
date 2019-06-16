//
//  ProjectsDetailDataSource.swift
//  MyPortfolioTests
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import MyPortfolio

class ProjectsDetailDataSourceTest: XCTestCase {
    
    var dataSource = ProjectsDetailDataSource()
    let tableView = UITableView()
    var projects: Projects!
    
    override func setUp() {
        
        projects = ProjectsDataSourceTest().mokeData().projects?[0] ?? Projects()
        dataSource.responsibilities = projects.Responsibility
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        
        dataSource = ProjectsDetailDataSource()
        projects = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDataSourceHasResults() {
        
        XCTAssertNotNil(dataSource.responsibilities, "DataSource should have correct number of responsibilities")
    }
    
    func testNumberOfRows() {
        
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertGreaterThan(numberOfRows, 0 , "Number of rows in table should match number of results")
    }
    
    
    func testCellForRow() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProjectsDetailViewController") as? ProjectsDetailViewController
        viewController?.project = projects
        viewController?.loadViewIfNeeded()
        
        
        let cell: UITableViewCell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "Experienced in developing the app for both iOS & Android.", "The textlabel should display the same name")
    }
    
    func testTableViewHasCells() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProjectsDetailViewController") as? ProjectsDetailViewController
        viewController?.project = projects

        viewController?.loadViewIfNeeded()
        
        let cell: UITableViewCell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertNotNil(cell, "TableView should be able to dequeue cell with identifier: 'UITableViewCell'")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
