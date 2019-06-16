//
//  ProjectViewModel.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

class ProjectViewModel {
    
    var reloadDataBlock: (() -> Void) = {
        
    }
    
    var alertDelegate: AlertDelegate?
    var projectsContant: ProjectsContent!
    
    func getDataFromService() {
        
        self.projectsContant = ProjectsContent()
        loadDatafromService { (_ model) in
            
            if model.projects != nil {
                
                self.projectsContant = model
            }
            self.reloadDataBlock()
        }
    }
    
    private func loadDatafromService(completionBlock: @escaping (ProjectsContent) -> Void) {
        
        if !(APIManager.isConnectedToNetwork()) {
            
            alertDelegate?.showOkButtonAlert(message: Constants.Message.noInternet, completionBlock: {
                self.reloadDataBlock()
            })
        }
        else {
            APIManager.getProjectsData { (success, result) in
                
                switch result {
                case .success(let response):
                    
                    if response.projects != nil {
                        
                        completionBlock(response)
                    }
                    else {
                        
                        completionBlock(ProjectsContent())
                        self.alertDelegate?.showOkButtonAlert(message: Constants.Message.somethinWrong, completionBlock: {
                            self.reloadDataBlock()
                        })
                    }
                    break
                case .failure:
                    
                    completionBlock(ProjectsContent())
                    self.alertDelegate?.showOkButtonAlert(message: Constants.Message.somethinWrong, completionBlock: {
                        self.reloadDataBlock()
                    })
                    break
                }
            }}
    }
}
