//
//  APIManager.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 15/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import SystemConfiguration

final class APIManager {
    
    static func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        if flags.isEmpty {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    @discardableResult
    static func getProfessionalSummeryData( completionBlock: @escaping (Bool, Result<ProfessionalContent, HDError>) -> Void) -> URLSessionDataTask {
        
        return APIClient.shared.dataRequest(router: .getProfessionalSummeryData, completionBlock: completionBlock)
    }
    
    @discardableResult
    static func getExperienceSummeryData( completionBlock: @escaping (Bool, Result<ExperienceContent, HDError>) -> Void) -> URLSessionDataTask {
        
        return APIClient.shared.dataRequest(router: .getExperienceSummeryData, completionBlock: completionBlock)
    }
    
    @discardableResult
    static func getSkillsData( completionBlock: @escaping (Bool, Result<SkillsContent, HDError>) -> Void) -> URLSessionDataTask {
        
        return APIClient.shared.dataRequest(router: .getSkillsData, completionBlock: completionBlock)
    }
    
    
    @discardableResult
    static func getProjectsData( completionBlock: @escaping (Bool, Result<ProjectsContent, HDError>) -> Void) -> URLSessionDataTask {
        
        return APIClient.shared.dataRequest(router: .getProjectsData, completionBlock: completionBlock)
    }
    
    
}
