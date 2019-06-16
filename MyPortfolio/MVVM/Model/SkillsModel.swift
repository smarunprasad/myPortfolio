//
//  SkillsModel.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

//MARK: To split the data from the Response
struct SkillsModel: Codable {
    
    var skillsfiles: SkillsModelfiles?
    
    enum CodingKeys: String, CodingKey {
        case skillsfiles = "files"
    }
}

struct SkillsModelfiles: Codable {
    
    var skills: SkillsObject?
}

struct SkillsObject: Codable {
    
    var content: String?
}

struct SkillsContent: Codable {
    
    var skills : Skills?
}

//MARK: To load data in table view
struct Skills: Codable {
    
    var development_tools: [String]!
    var Programing_launguage: [String]!
    var Designing: [String]!
    var Frameworks: [String]!
    var Design_tools: [String]!
    var API: [String]!
    var DataBase: [String]!
    var Software_development_methodologies: [String]!
    var Version_controller: [String]!
    var Misc: String!
}

