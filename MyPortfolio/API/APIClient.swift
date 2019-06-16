//
//  APIClient.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 15/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

class APIClient {
    
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
                    
                    self.convertProfessionalSummeryModelJsonDataToModelBasedOnTheType(jsonData: jsonData, completionBlock: completionBlock)
                }
                else if M.self == ExperienceContent.self {
                    
                    self.convertExperienceSummeryModelJsonDataToModelBasedOnTheType(jsonData: jsonData, completionBlock: completionBlock)
                }
                else if M.self == SkillsContent.self {
                    
                    self.convertSkillsModelJsonDataToModelBasedOnTheType(jsonData: jsonData, completionBlock: completionBlock)
                }
                else if M.self == ProjectsContent.self {
                    
                    self.convertProjectsModelJsonDataToModelBasedOnTheType(jsonData: jsonData, completionBlock: completionBlock)
                }
                else if M.self == EducationContent.self {
                    
                    self.convertEducationModelJsonDataToModelBasedOnTheType(jsonData: jsonData, completionBlock: completionBlock)
                }
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
            
        }
        dataTask.resume()
        return dataTask
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
            
            if let aProfissionData = json.experienceSummeryfiles?.experience?.content?.data(using: .utf8) {
                
                let json = try JSONDecoder().decode(M.self, from: aProfissionData)
                completionBlock (true, Result.success(json))
            }
        }
        catch {
            
            completionBlock (false, Result.failure(HDError.serverSideError))
        }
    }
    
    func convertSkillsModelJsonDataToModelBasedOnTheType<M: Codable>(jsonData: Data, completionBlock: @escaping (_ success: Bool, _ result: Result<M,HDError>) -> Void) {
        
        do {
            let json = try JSONDecoder().decode(SkillsModel.self, from: jsonData)
            
            if let aData = json.skillsfiles?.skills?.content?.data(using: .utf8) {
                
                let json = try JSONDecoder().decode(M.self, from: aData)
                completionBlock (true, Result.success(json))
            }
        }
        catch {
            
            completionBlock (false, Result.failure(HDError.serverSideError))
        }
    }
    
    
    func convertEducationModelJsonDataToModelBasedOnTheType<M: Codable>(jsonData: Data, completionBlock: @escaping (_ success: Bool, _ result: Result<M,HDError>) -> Void) {
        
        do {
            let json = try JSONDecoder().decode(EducationModel.self, from: jsonData)
            
            if let aData = json.educationfiles?.academy?.content?.data(using: .utf8) {
                
                let json = try JSONDecoder().decode(M.self, from: aData)
                completionBlock (true, Result.success(json))
            }
        }
        catch {
            
            completionBlock (false, Result.failure(HDError.serverSideError))
        }
    }
    
    
    func convertProjectsModelJsonDataToModelBasedOnTheType<M: Codable>(jsonData: Data, completionBlock: @escaping (_ success: Bool, _ result: Result<M,HDError>) -> Void) {
        
        do {
            let json = try JSONDecoder().decode(ProjectsModel.self, from: jsonData)
            
            if let aData = json.projectsfiles?.projects?.content?.data(using: .utf8) {
                
                let json = try JSONDecoder().decode(M.self, from: aData)
                completionBlock (true, Result.success(json))
            }
        }
        catch {
            
            completionBlock (false, Result.failure(HDError.serverSideError))
        }
    }
}
