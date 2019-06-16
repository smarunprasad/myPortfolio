//
//  SkillsDataSourceTest.swift
//  MyPortfolioTests
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import MyPortfolio

class SkillsDataSourceTest: XCTestCase {
    
    var dataSource = SkillsDataSource()
    let tableView = UITableView()
    
    override func setUp() {
        
        dataSource.skills = mokeData().skills ?? Skills()
        self.tableView.register(UINib.init(nibName: ExperienceTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ExperienceTableViewCell.identifier)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        
        dataSource = SkillsDataSource()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDataSourceHasResults() {
        
        XCTAssertNotNil(dataSource.skills, "DataSource should have correct number of skills")
    }
    
    func testNumberOfRows() {
        
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 3, "Number of rows in table should match number of results")
    }
    
    
    func testCellForRow() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SkillsViewController") as? SkillsViewController
        viewController?.loadViewIfNeeded()
        
        
        let cell: UITableViewCell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "Xcode", "The textlabel should display the same name")
    }
    
    func testTableViewHasCells() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SkillsViewController") as? SkillsViewController
        viewController?.loadViewIfNeeded()
        
        let cell: UITableViewCell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertNotNil(cell, "TableView should be able to dequeue cell with identifier: 'UITableViewCell'")
    }
    
    func mokeData() -> SkillsContent {
        
        let jsonData = "{\n  \"skills\": {\n    \"development_tools\": [\n      \"Xcode\",\n      \"Android studio\",\n      \"Subline Text\"\n    ],\n    \"Programing_launguage\": [\n      \"Swift\",\n      \"Objective-C\",\n      \"Kotlin\",\n      \"Java script\"\n    ],\n    \"Designing\": [\n      \"Autolayouts\",\n      \"Frames\",\n      \"Size class\"\n    ],\n    \"Frameworks\": [\n      \"UIKit\",\n      \"FoundationKit\",\n      \"SwiftUI\",\n      \"Combine\",\n      \"MapKit\",\n      \"WKWebKit\",\n      \"AVFoundation\"\n    ],\n    \"Design_tools\": [\n      \"Sketch\",\n      \"In-Vision\",\n      \"Justinmind\"\n    ],\n    \"API\": [\n      \"RESTAPI\",\n      \"XML\",\n      \"JSON\",\n      \"Soap\"\n    ],\n    \"DataBase\": [\n      \"CoreData\",\n      \"Sqlite\",\n      \"Realm\",\n      \"FireBase\"\n    ],\n    \"Software_development_methodologies\": [\n      \"Agile\",\n      \"Scrum\",\n      \"Waterfall\"\n    ],\n    \"Version_controller\": [\n      \"Github\",\n      \"Gitlab\",\n      \"SVN\"\n    ],\n    \"Misc\": \"Core Animation, Payment Gateway Integration, API Integration,  Push Notification, use of mobile local database,  iCloud, UIKit, HomeKit, UIAlertView Controller, SignalR, Web Socket, SocketIO, Social networking integration, One time Password (OTP), Mobile text messages for validation, Troubleshooting, Google Map Kit,Google Navigator, Chat Functionality ( Sync and ASync messaging), Performance tuning, bug fixing, app code optimisation, Testing, Notification content extension, Share extension, Action extension, Photo editing extension, iCloud, Support And maintenance, Gap Analysis, Impact Analysis, Agile scrum, Jenkins, Version control, Calabash, Fastlane, Authentication and Change Requests handling, XML, SDK, WatchKit, Cocoa,Continuous Integration CI & CD Continuous Deployment,TDD, BDD, Code Coverage, DevOps pair programming,Multithreading, Cocoa pods, Carthage, Best practices for security based systems, Coding standards, Code Reusability, iPhone Memory Management & Instruments (memory leak determination, code optimisation, ARC), General data structures/algorithms (computational/storage complexity), RxSWIFT, iOS unit test framework, UI/UX standards, VIPER architecture, Cucumber and Calabash\"\n  }\n}"
        
        
        if let data = jsonData.data(using: .utf8, allowLossyConversion: true) {
            
            do {
                let json = try JSONDecoder().decode(SkillsContent.self, from: data)
                return json
            }
            catch {
                
            }
        }
        return SkillsContent()
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
