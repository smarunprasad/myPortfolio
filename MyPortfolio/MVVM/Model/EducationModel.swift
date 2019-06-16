//
//  EducationModel.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

//MARK: To split the data from the Response
struct EducationModel: Codable {
    
    var educationfiles: Educationfiles?
    
    enum CodingKeys: String, CodingKey {
        case educationfiles = "files"
    }
}

struct Educationfiles: Codable {
    
    var academy: Academy?
}

struct Academy: Codable {
    
    var content: String?
}

struct EducationContent: Codable {
    
    var education : Education?
    var certificate : Certificate?
    var Summery: String!
}

//MARK: To load data in table view
struct Education: Codable {
    
    var collage_name: String!
    var degree: String!
    var start_date: String!
    var end_date: String!
    var collage_image: String!
}

struct Certificate: Codable {
    
    var institute_name: String!
    var certificate_title: String!
    var start_date: String!
    var end_date: String!
    var institute_image: String!
}
