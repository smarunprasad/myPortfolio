//
//  APIClient.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 15/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

final class APIClient {
    
    static let shared = APIClient()
    private let session = URLSession.shared
    
    func dataRequest<M: Codable>(router: APIRouter, completionBlock: @escaping (_ success: Bool, _ result: Result<M,HDError>) -> Void) -> URLSessionDataTask {
        
        let dataTask = session.dataTask(with: router.asUrlRequest()) { (data, respose, error) in
            
            guard let data = data else {
                completionBlock (false, Result.failure(HDError.clientSideError))
                return
            }
            
            do {
                // make sure this JSON is in the format we expect
                let glist = try JSONSerialization.jsonObject(with: data, options: [])
                let jsonData = try JSONSerialization.data(withJSONObject: glist, options: [])
                
                // It is checked to convert the content key value from string to model file
                if M.self == ProfessionalContent.self {
                    
                    convertProfessionalSummeryModelJsonDataToModelBasedOnTheType(jsonData: jsonData, completionBlock: completionBlock)
                }
                else if M.self == ExperienceContent.self {
                    
                    convertExperienceSummeryModelJsonDataToModelBasedOnTheType(jsonData: jsonData, completionBlock: completionBlock)
                }
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
            
        }
        dataTask.resume()
        return dataTask
    }
}


func convertProfessionalSummeryModelJsonDataToModelBasedOnTheType<M: Codable>(jsonData: Data, completionBlock: @escaping (_ success: Bool, _ result: Result<M,HDError>) -> Void) {
    
    do {
        let json = try JSONDecoder().decode(ProfessionalSummeryModel.self, from: jsonData)
        
        if let aProfissionData = json.ProfessionalSummeryfiles?.professional?.content?.data(using: .utf8) {
            
            let json = try JSONDecoder().decode(M.self, from: aProfissionData)
            completionBlock (true, Result.success(json))
        }
    }
    catch {
        
        completionBlock (false, Result.failure(HDError.serverSideError))
    }
}

func convertExperienceSummeryModelJsonDataToModelBasedOnTheType<M: Codable>(jsonData: Data, completionBlock: @escaping (_ success: Bool, _ result: Result<M,HDError>) -> Void) {
    
    do {
        let json = try JSONDecoder().decode(ExperienceSummeryModel.self, from: jsonData)
        
        if let aProfissionData = json.ExperienceSummeryfiles?.experience?.content?.data(using: .utf8) {
            
            let json = try JSONDecoder().decode(M.self, from: aProfissionData)
            completionBlock (true, Result.success(json))
        }
    }
    catch {
        
        completionBlock (false, Result.failure(HDError.serverSideError))
    }
}
