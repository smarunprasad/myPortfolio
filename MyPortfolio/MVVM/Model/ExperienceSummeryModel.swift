//
//  ExperienceSummeryModel.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

//MARK: To split the data from the Response
struct ExperienceSummeryModel: Codable {
    
    var experienceSummeryfiles: ExperienceSummeryfiles?
    
    enum CodingKeys: String, CodingKey {
        case experienceSummeryfiles = "files"
    }
}

struct ExperienceSummeryfiles: Codable {
    
    var experience: experience?
}

struct experience: Codable {
    
    var content: String?
}

struct ExperienceContent: Codable {
    
    var experienceSummery : [ExperienceSummery]?
    
    enum CodingKeys: String, CodingKey {
        case experienceSummery = "experience"
    }
}

//MARK: To load data in table view
struct ExperienceSummery: Codable {
    
    var company_name: String!
    var job_title: String!
    var start_date: String!
    var end_date: String!
    var company_image: String!
}
