//
//  ApiConstants.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation


struct GistUrl {
    
    static let baseUrl = "https://api.github.com/gists/"
    static let homeUrl = "ac57abaea4faba3e3cb6bf45e733c670"
    static let experienceUrl = "6a631e56df5fa8ff1e8b2dbae8d41df0"
    static let skillsUrl = "d5fd151f95612e8af88ff9911a750fd6"
    static let projectsUrl = "ab1cec42c0a033d8d272da614b30ae10"
    static let educationUrl = "074da4c9c4e60142a2a3ad6b1ff65f7c"
}


enum HDError: Error {
    
    case invalidURL
    case clientSideError
    case serverSideError
    case jsonSerializing(String)
    case errorjsonSerializing(String)
    case jsonEncoding
}

protocol URLRequestConvertible {
    /// Returns a URL request or throws if an `Error` was encountered.
    ///
    /// - throws: An `Error` if the underlying `URLRequest` is `nil`.
    ///
    /// - returns: A URL request.
    
    func asURLRequest() -> URLRequest
}
