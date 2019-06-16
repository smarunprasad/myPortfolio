//
//  APIRouter.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 15/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

enum HttpMethode: String {
    
    case get = "get"
    
    var value: String {
        return self.rawValue
    }
}

enum APIRouter {
    
    case getProfessionalSummeryData
    case getExperienceSummeryData
    case getSkillsData
    case getProjectsData
    case getEducationData
}

extension APIRouter {
    
    //changing the url based on the router type
    private var url: URL {
        switch self {
        case .getProfessionalSummeryData:
            return URL.init(string:"\(GistUrl.baseUrl)\(GistUrl.homeUrl)")!
        case .getExperienceSummeryData:
            return URL.init(string:"\(GistUrl.baseUrl)\(GistUrl.experienceUrl)")!
        case .getSkillsData:
            return URL.init(string:"\(GistUrl.baseUrl)\(GistUrl.skillsUrl)")!
        case .getProjectsData:
            return URL.init(string:"\(GistUrl.baseUrl)\(GistUrl.projectsUrl)")!
        case .getEducationData:
            return URL.init(string:"\(GistUrl.baseUrl)\(GistUrl.educationUrl)")!
            
        }
    }
    
    private var methode: HttpMethode {
     
        return .get
    }
    
    func asUrlRequest() -> URLRequest {
        
        var urlRequest = URLRequest.init(url: url)
        urlRequest.httpMethod = methode.value
        return urlRequest
    }
}
