//
//  HomeDataSourceTest.swift
//  MyPortfolioTests
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import MyPortfolio

class HomeDataSourceTest: XCTestCase {
    
    
    var dataSource = HomeDataSource()
    let tableView = UITableView()
    
    override func setUp() {
        
        dataSource.professionalSummery = mokeData().professionalSummery ?? ProfessionalSummery()
        self.tableView.register(UINib.init(nibName: ProfessionalHeaderTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ProfessionalHeaderTableViewCell.identifier)
        self.tableView.register(UINib.init(nibName: SalaryTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SalaryTableViewCell.identifier)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        
        dataSource = HomeDataSource()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDataSourceHasResults() {
        
        XCTAssertNotNil(dataSource.professionalSummery, "DataSource should have correct number of professionalSummery")
    }
    
    func testHasSectionsWhenResults() {
        
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 4, "TableView should have 1 sections when data present")
    }
    
    func testHasZeroSectionsWhenNoResults() {
        
        dataSource.professionalSummery = ProfessionalSummery()
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 0, "TableView should have zero sections when no data present")
    }
    
    func testNumberOfRows() {
        
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 1, "Number of rows in table should match number of results")
    }
    
    
    func testCellForRow() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        viewController?.loadViewIfNeeded()
        
        
        let cell: ProfessionalHeaderTableViewCell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ProfessionalHeaderTableViewCell
        XCTAssertEqual(cell.nameLabel?.text, "Arun Prasad", "The nameLabel should display the same name")
        
        let salaryCell: SalaryTableViewCell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 3)) as! SalaryTableViewCell
        XCTAssertEqual(salaryCell.salaryTypeLabel?.text, "Contract", "The salaryTypeLabel should display the same name")
        
    }
    
    func testTableViewHasCells() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        viewController?.loadViewIfNeeded()
        
        
        let cell: ProfessionalHeaderTableViewCell? = viewController?.tableView.dequeueReusableCell(withIdentifier: ProfessionalHeaderTableViewCell.identifier) as? ProfessionalHeaderTableViewCell
        
        XCTAssertNotNil(cell, "TableView should be able to dequeue cell with identifier: 'ProfessionalHeaderTableViewCell'")
        
        let salaryCell: SalaryTableViewCell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 3)) as! SalaryTableViewCell
        
        XCTAssertNotNil(salaryCell, "TableView should be able to dequeue cell with identifier: 'SalaryTableViewCell'")
    }
    
    func mokeData() -> ProfessionalContent {
        
        let jsonData = "{\n  \"Professional_Summery\": {\n    \"name\": \"Arun Prasad\",\n    \"summery\": \"Seeking for new roles - Available immediately\",\n    \"describtion\": \"I have 5 years experience in mobile application design, development, support and delivery. I have developed 25 applications in iOS, 3 Projects in Android & 2 projects in React Native \\n My Key skill sets are Objective-C, Swift, Unit Testing, Auto Layouts, SwiftUI, MVVM, MVC, RxSwift, MapKit, Google Map, Google Navigation, Payment gateway. I have worked on complete Software development life cycle.\\nI am looking for new  roles in UK and ready to start immediately. I am located at East London and ready to commute anywhere in UK. Please feel free to reach me for any clarification\",\n    \"current_company\": \"Tavistock Investments PLC\",\n    \"status\": \"Actively looking for new roles\",\n    \"profile_picture\": \"https://www.startus.cc/system/files/styles/squared_photos_style/private/photo/fileYAcbE0.jpg?itok=r0FrU54L\",\n    \"background_picture\": \"https://qph.fs.quoracdn.net/main-qimg-1ec6feba210c804f0c38dd884d10ee2c\",\n    \"last_updated_on\": \"2019-06-14T07:00:00Z\",\n    \"career_interest\": true,\n    \"mobile_number\": \"7733248495\",\n    \"salary\": [\n      {\n        \"type\": \"Contract\",\n        \"rate\": 300,\n        \"sponsor\": false\n      },\n      {\n        \"type\": \"Permanant\",\n        \"rate\": 55000,\n        \"sponsor\": true\n      }\n    ]\n  }\n}"
        
        
        if let data = jsonData.data(using: .utf8, allowLossyConversion: true) {
            
            do {
                let json = try JSONDecoder().decode(ProfessionalContent.self, from: data)
                return json
            }
            catch {
                
            }
        }
        return ProfessionalContent()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
