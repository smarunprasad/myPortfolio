//
//  ProfessionalSummeryModel.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 15/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

struct ProfessionalSummeryModel: Codable {
    
    let ProfesionalSummery : ProfesionalSummery!
    
    enum CodingKeys: String, CodingKey {
        case ProfesionalSummery = "Profesional_Summery"
    }
}

struct ProfesionalSummery: Codable {
    
    let name: String!
    let summery: String!
    let current_company: String!
    let status: String!
    let profile_picture: String!
    let background_picture: String!
    let last_updated_on: String!
    let career_interest: Bool!
    let mobile_number: String!
    let salary: [salary]!
}

struct salary: Codable {
    
    let type: String!
    let rate: Int!
    let sponsor: Bool!
}
