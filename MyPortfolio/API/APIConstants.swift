//
//  ApiConstants.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation


struct GistUrl {
    
    static let baseUrl = "https://gist.github.com/"
    static let homeUrl = "ac57abaea4faba3e3cb6bf45e733c670.git"
    static let experienceUrl = ""
    static let skillsUrl = ""
    static let projectsUrl = ""
    static let educationUrl = ""
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
