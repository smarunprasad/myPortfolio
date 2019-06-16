//
//  ProjectsDataSourceTest.swift
//  MyPortfolioTests
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import XCTest
@testable import MyPortfolio

class ProjectsDataSourceTest: XCTestCase {
    
    var dataSource = ProjectsDataSource()
    let tableView = UITableView()
    
    override func setUp() {
        
        dataSource.projects = mokeData().projects ?? [Projects]()
        self.tableView.register(UINib.init(nibName: ProjectsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ProjectsTableViewCell.identifier)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        
        dataSource = ProjectsDataSource()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDataSourceHasResults() {
        
        XCTAssertNotNil(dataSource.projects, "DataSource should have correct number of projects")
    }
    
    func testNumberOfRows() {
        
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertGreaterThan(numberOfRows, 0 , "Number of rows in table should match number of results")
    }
    
    
    func testCellForRow() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProjectsViewController") as? ProjectsViewController
        viewController?.loadViewIfNeeded()
        
        let cell: ProjectsTableViewCell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ProjectsTableViewCell
        XCTAssertEqual(cell.appNameLabel?.text, "i-Stock", "The companyNameLabel should display the same name")    }
    
    func testTableViewHasCells() {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProjectsViewController") as? ProjectsViewController
        viewController?.loadViewIfNeeded()
        
        let cell: ProjectsTableViewCell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ProjectsTableViewCell
        
        XCTAssertNotNil(cell, "TableView should be able to dequeue cell with identifier: 'ExperienceTableViewCell'")
    }
    
    func mokeData() -> ProjectsContent {
        
        let jsonData =  "{\n  \"projects\": [\n    {\n      \"project_title\": \"i-Stock\",\n      \"client\": \"Tavistock Investment PLC\",\n      \"start_date\": \"2019-01-03\",\n      \"end_date\": \"2019-03-28\",\n      \"Responsibility\": [\n        \"Experienced in developing the app for both iOS & Android.\",\n        \"Experienced in working with Project Manager, Designer & Tester.\",\n        \"Customised the default WKWebview behaviours by using the JavaScript code.\",\n        \"Experienced in testing the application using TDD and fixed the bugs in both Platform.\",\n        \"Shared the new ideas to the client for increasing  the productivity.\",\n        \"Experienced in designing the application for both iOS & Android.\",\n        \"Used Sourcetree for update the changes in the Gitlab.\",\n        \"Experienced in setup the details for both Apple developer portal and Google play store console.\",\n        \"Experienced in testing the web page in different screen sizes of mobiles and shares the bugs to web team for fixing.\",\n        \"Experience in using AWS service and implementing CI for integrating the code.\",\n        \"Having a good understanding of the whole work flow fo application in Mobile and also in Website.\"\n      ]\n    },\n    {\n      \"project_title\": \"EvoBus\",\n      \"client\": \"Mercedes Benz Research and Development India Pvt ltd\",\n      \"start_date\": \"2018-07-06\",\n      \"end_date\": \"2018-12-28\",\n      \"Responsibility\": [\n        \"Used Json web service for GET, POST & DELETE method.\",\n        \"Experienced in using the PFPdfkit.To show the HTML content in the PFPdf kit.\",\n        \"Experienced in saving the plist files in local path and shown it in the web page.\",\n        \"Experience in designing the UI for iPad.\",\n        \"Used core data to save the objects and shown the data at the next time while the app launches.\",\n        \"Worked closely with the technical lead & backend developer.\",\n        \"Worked closely with company executives to identify new business opportunities.\",\n        \"Used Sourcetree for update the changes in the Gitlab.\",\n        \"Experienced in using CI & CD for integrating and deployment of the code.\",\n        \"Experienced in working with backend with NodeJs and MYSQL.\",\n        \"Experienced in using MVVM pattern.\"\n      ]\n    },\n    {\n      \"project_title\": \"Capsule\",\n      \"client\": \"Nextgen WebService Pvt ltd\",\n      \"start_date\": \"2017-10-06\",\n      \"end_date\": \"2018-06-28\",\n      \"Responsibility\": [\n        \"The card swipe animation had done for  Capsule list.\",\n        \"Facebook Graph Api for place search to create a Capsule on the place.\",\n        \"App Group function had done for  sharing  the post.\",\n        \"Rich Notification has implemented for user’s easy view of  post (images or video).\",\n        \"TDD had applied for the Capsule list functional logic.\",\n        \"Worked closely with company executives to identify new business opportunities.\",\n        \"Experienced in using Github with Sourcetree.\",\n        \"Experienced in using CI & CD for integrating and deployment of the code.\",\n        \"Experienced in using Web Socket for the instant updates\"\n      ]\n    },\n    {\n      \"project_title\": \"FindaDoctor\",\n      \"client\": \"Superior Innovative Technologies\",\n      \"start_date\": \"2017-01-06\",\n      \"end_date\": \"2017-10-03\",\n      \"Responsibility\": [\n        \"Experienced in using SocketIO for the instant updates.\",\n        \"Experienced in using the MapKit for the user to navigate to the doctor location.\",\n        \"Experienced in using SVN for the code update.\",\n        \"One module screen design & functionality in web using HTML, CSS,  AngularJs and NodeJs.\",\n        \"Used Json web service for GET & POST method. The web service is done by using the NodeJs and the data are getting from the MYSQL.\",\n        \"Used calendar to add the remainders for the doctor appointment.\",\n        \"Allow option to change the URL from live to local  from the Settings app itself.\",\n        \"Use Google kit, Google place search for book the doctor appointment.\"\n      ]\n    },\n    {\n      \"project_title\": \"Fulltank\",\n      \"client\": \"Fulltank Pvt ltd\",\n      \"start_date\": \"2016-06-02\",\n      \"end_date\": \"2016-12-28\",\n      \"Responsibility\": [\n        \"Experience in integrating the Payment gateway(pay u biz)\",\n        \"Experienced in developing & designing the app for both iOS & Android.\",\n        \"Use Google kit, Google place search for request a ride with searched place.\",\n        \"UIDesign is done as the design shared by the client.\",\n        \"Using Push Notification for every request the user receives the notification for request status changes.\",\n        \"Experience in using Json Web service & sqlite for save data locally.\",\n        \"Experience in integrating PayU Biz with their support team & achieve the transaction.\",\n        \"Experience in using social login & share.\",\n        \"Experience in converting the Android java code to kotlin code.\"\n      ]\n    },\n    {\n      \"project_title\": \"Coromandel dealer connect\",\n      \"client\": \"Coromandel International Ltd\",\n      \"start_date\": \"2016-01-08\",\n      \"end_date\": \"2016-06-02\",\n      \"Responsibility\": [\n        \"Use Soap Web service for Save, Update, Delete & Retrieve purpose.\",\n        \"Experienced in developing & designing the app for both iOS & Android.\",\n        \"Using  iCloud, Google drive & to update the file to API and also save the documents.\",\n        \"Experience in using the printer for printing the documents.\",\n        \"Using default textfield in UIAlertViewController for picker option.\",\n        \"Experience in designing the Weather forecast as iOS weather app for showing the weather for the weak.\",\n        \"Experience in using the MVVM pattern for code alignment and making SDK for the model class to use it in another projects.\",\n        \"Experience in using the UserDefaults for save the data and show it to the user.\"\n      ]\n    },\n    {\n      \"project_title\": \"HomeInspector\",\n      \"client\": \"Angler Technologies\",\n      \"start_date\": \"2015-07-01\",\n      \"end_date\": \"2015-12-28\",\n      \"Responsibility\": [\n        \"Experienced in integrating Bluetooth to control the home application from the mobile.\",\n        \"Used Json web service for GET & POST method. The web service is done by using the NodeJs and the data are getting from the MYSQL.\",\n        \"Used calendar to add the remainders for switch on the heater & switch on the fan.\",\n        \"Used Redbearlab Bluetooth low power shield device to control the home appliances.\",\n        \"TDD had applied for the Capsule list functional logic.\",\n        \"Experienced in setup the details for both Apple developer portal.\",\n        \"Experienced in using MVVM design pattern.\"\n      ]\n    },\n    {\n      \"project_title\": \"MyHositalAdvisor\",\n      \"client\": \"Angler Technologies\",\n      \"start_date\": \"2015-01-08\",\n      \"end_date\": \"2015-06-28\",\n      \"Responsibility\": [\n        \"Experience in using Restful web service.\",\n        \"Experienced in creating custom design based on the data.\",\n        \"Experienced in working with backend with NodeJs and MYSQL.\",\n        \"Use Google map, Google place search for searching the doctor.\",\n        \"Also it allows you to choose blood donation and nearest blood banks and guide about the number of beds.\",\n        \"Make patient to search for a specialist, doctors ratings , reviews, hospital reviews and so for the hospitals.\",\n        \"Designing attractive design as given by client.\",\n        \"Having experience in client coordination.\"\n      ]\n    }\n  ]\n}"
        
        
        
        if let data = jsonData.data(using: .utf8, allowLossyConversion: true) {
            
            do {
                let json = try JSONDecoder().decode(ProjectsContent.self, from: data)
                return json
            }
            catch {
                
            }
        }
        return ProjectsContent()
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
