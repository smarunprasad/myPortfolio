//
//  ExperienceDataSourceTest.swift
//  MyPortfolioTests
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import MyPortfolio

class ExperienceDataSourceTest: XCTestCase {
    
    var dataSource = ExperienceDataSource()
    let tableView = UITableView()
    
    override func setUp() {
        
        dataSource.experienceSummery = mokeData().experienceSummery ?? [ExperienceSummery]()
        self.tableView.register(UINib.init(nibName: ExperienceTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ExperienceTableViewCell.identifier)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        
        dataSource = ExperienceDataSource()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDataSourceHasResults() {
        
        XCTAssertNotNil(dataSource.experienceSummery, "DataSource should have correct number of experienceSummery")
    }
    
    func testNumberOfRows() {
        
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 5, "Number of rows in table should match number of results")
    }
    
    
    func testCellForRow() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExperienceViewController") as? ExperienceViewController
        viewController?.loadViewIfNeeded()
        
        
        let cell: ExperienceTableViewCell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExperienceTableViewCell
        XCTAssertEqual(cell.companyNameLabel?.text, "Tavistock Investments PLC", "The companyNameLabel should display the same name")
    }
    
    func testTableViewHasCells() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExperienceViewController") as? ExperienceViewController
        viewController?.loadViewIfNeeded()
        
        
        let cell: ExperienceTableViewCell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExperienceTableViewCell
        
        XCTAssertNotNil(cell, "TableView should be able to dequeue cell with identifier: 'ExperienceTableViewCell'")
    }
    
    func mokeData() -> ExperienceContent {
        
        let jsonData =  "{\n  \"experience\": [\n    {\n    \"company_name\": \"Tavistock Investments PLC\",\n    \"job_title\": \"Senior Mobile Developer\",\n    \"start_date\": \"2019-01-03\",\n    \"end_date\": \"2019-03-28\",\n    \"company_image\": \"https://media.licdn.com/dms/image/C4E0BAQEGKL02OyUkUQ/company-logo_200_200/0?e=2159024400&v=beta&t=YYkHmdt1v6uWLMYtVwu0e5g0sFJWUoEfemXh50cnMu0\"\n    },\n    {\n    \"company_name\": \"Mercedes Benz Research and Development India Pvt ltd\",\n    \"job_title\": \"Senior iOS Developer\",\n    \"start_date\": \"2018-07-03\",\n    \"end_date\": \"2018-12-27\",\n    \"company_image\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTR1rTVO6VXUsDi_IMagKRQd55Kl_-3GSbH5wh2o8v_78Lm7_UG\"\n    },\n    {\n    \"company_name\": \"Nextgen\",\n    \"job_title\": \"Senior iOS Developer\",\n    \"start_date\": \"2017-10-10\",\n    \"end_date\": \"2018-06-28\",\n    \"company_image\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4jDoLZ-sLKvvThhwKMYyU2-Qn4fQp6_6BhS-PcqSQmaKDvk2tWQ\"\n    },\n    {\n    \"company_name\": \"Superior Innovative Technologies\",\n    \"job_title\": \"Senior Mobile Developer\",\n    \"start_date\": \"2017-01-03\",\n    \"end_date\": \"2017-10-03\",\n    \"company_image\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS32MwAJf5tMw4K1VlffyikYmz0Qbt6JnWiTiFJlu0l5BFFNpx_\"\n    },\n    {\n    \"company_name\": \"Angler Technologies\",\n    \"job_title\": \"Senior iOS Developer\",\n    \"start_date\": \"2013-06-03\",\n    \"end_date\": \"2016-12-28\",\n    \"company_image\": \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsvIRD5B-gYx0P7ERuVrF9ynljWe_yjKQty3O1D6D9XCz14rh2\"\n    }\n    ]\n}"
        
        
        if let data = jsonData.data(using: .utf8, allowLossyConversion: true) {
            
            do {
                let json = try JSONDecoder().decode(ExperienceContent.self, from: data)
                return json
            }
            catch {
                
            }
        }
        return ExperienceContent()
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
