//
//  ProfessionalSummeryModel.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 15/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

//MARK: To split the data from the Response
struct ProfessionalSummeryModel: Codable {
    
    var ProfessionalSummeryfiles: ProfessionalSummeryfiles?
    
    enum CodingKeys: String, CodingKey {
        case ProfessionalSummeryfiles = "files"
    }
}

struct ProfessionalSummeryfiles: Codable {
    
    var professional: Professional?
    
    enum CodingKeys: String, CodingKey {
        case professional = "professional_summery"
    }
}

struct Professional: Codable {
    
    var content: String?
}


struct ProfessionalContent: Codable {
    
    var professionalSummery : ProfessionalSummery?

    enum CodingKeys: String, CodingKey {
        case professionalSummery = "Professional_Summery"
    }
}

//MARK: To load data in table view
struct ProfessionalSummery: Codable {
    
    var name: String!
    var summery: String!
    var describtion: String!
    var current_company: String!
    var status: String!
    var profile_picture: String!
    var background_picture: String!
    var last_updated_on: String!
    var mobile_number: String!
    var salary: [Salary]!
}

struct Salary: Codable {
    
    var type: String!
    var rate: Int!
    var sponsor: Bool!
}
