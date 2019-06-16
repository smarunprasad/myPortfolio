//
//  EducationDataSourceTest.swift
//  MyPortfolioTests
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import MyPortfolio

class EducationDataSourceTest: XCTestCase {
    
    var dataSource = EducationDataSource()
    let tableView = UITableView()
    
    override func setUp() {
        
        dataSource.educationContent = mokeData() 
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib.init(nibName: ExperienceTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ExperienceTableViewCell.identifier)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        
        dataSource = EducationDataSource()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDataSourceHasResults() {
        
        XCTAssertNotNil(dataSource.educationContent, "DataSource should have correct number of educationContent")
    }
    
    func testNumberOfRows() {
        
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 1 , "Number of rows in table should match number of results")
    }
    
    func testCellForRow() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EducationViewController") as? EducationViewController
        viewController?.loadViewIfNeeded()
        
        let cell: ExperienceTableViewCell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExperienceTableViewCell
        XCTAssertEqual(cell.companyNameLabel?.text, "Anna University", "The companyNameLabel should display the same name")    }
    
    func testTableViewHasCells() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EducationViewController") as? EducationViewController
        viewController?.loadViewIfNeeded()
        
        let cell: ExperienceTableViewCell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExperienceTableViewCell
        
        XCTAssertNotNil(cell, "TableView should be able to dequeue cell with identifier: 'ExperienceTableViewCell'")
    }
    
    func mokeData() -> EducationContent {
        
        let jsonData =  "{\n  \"education\": {\n    \"collage_name\": \"Anna University\",\n    \"degree\": \"Batchlor Degree\",\n    \"start_date\": \"2009-06-03\",\n    \"end_date\": \"2013-05-18\",\n    \"collage_image\": \"https://upload.wikimedia.org/wikipedia/en/thumb/4/49/Anna_University_Logo.svg/220px-Anna_University_Logo.svg.png\"\n  },\n  \"certificate\": {\n    \"institute_name\": \"N-Schools Technologies\",\n    \"certificate_title\": \"iOS developer\",\n    \"start_date\": \"2013-03-18\",\n    \"end_date\": \"2013-06-08\",\n    \"institute_image\": \"https://i0.wp.com/www.canadiantraininginstitute.com/wp-content/uploads/2019/03/cropped-icon.jpg?fit=512%2C512&ssl=1\"\n  },\n  \"Summery\": \"I have involved in all phases of Software Development life cycle. Please let me know if I am fit for your Job description. Thank you for considering my CV and your Valuable time.\"\n}"
        
        
        if let data = jsonData.data(using: .utf8, allowLossyConversion: true) {
            
            do {
                let json = try JSONDecoder().decode(EducationContent.self, from: data)
                return json
            }
            catch {
                
            }
        }
        return EducationContent()
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
