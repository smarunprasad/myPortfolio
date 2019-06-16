//
//  ProjectsModel.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

//MARK: To split the data from the Response
struct ProjectsModel: Codable {
    
    var projectsfiles: ProjectsModelfiles?
    
    enum CodingKeys: String, CodingKey {
        case projectsfiles = "files"
    }
}

struct ProjectsModelfiles: Codable {
    
    var projects: ProjectsObject?
}

struct ProjectsObject: Codable {
    
    var content: String?
}

struct ProjectsContent: Codable {
    
    var projects : [Projects]?
}

//MARK: To load data in table view
struct Projects: Codable {
    
    var project_title: String!
    var client: String!
    var start_date: String!
    var end_date: String!
    var Responsibility: [String]!
}

