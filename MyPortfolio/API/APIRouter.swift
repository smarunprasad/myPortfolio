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
    
    case getProfessionalSummeryData()
}

extension APIRouter {
    
    private var url: URL {
        switch self {
        case .getProfessionalSummeryData:
            return URL.init(string:"\(GistUrl.baseUrl)\(GistUrl.homeUrl)")!
        }
    }
    
    private var methode: HttpMethode {
        switch self {
        case .getProfessionalSummeryData: return .get
        }
    }
    
    func asUrlRequest() -> URLRequest {
        
        var urlRequest = URLRequest.init(url: url)
        urlRequest.httpMethod = methode.value
        return urlRequest
    }
}
