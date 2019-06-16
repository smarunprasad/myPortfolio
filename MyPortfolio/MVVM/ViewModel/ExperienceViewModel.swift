//
//  ExperienceViewModel.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

class ExperienceViewModel {

    var reloadDataBlock: (() -> Void) = {
        
    }
    
    var alertDelegate: AlertDelegate?
    var experienceContant: ExperienceContent!
    
    func getDataFromService() {
        
        self.experienceContant = ExperienceContent()
        loadDatafromService { (_ model) in
            
            if model.experienceSummery != nil {
                
                self.experienceContant = model
            }
            self.reloadDataBlock()
        }
    }
    
    private func loadDatafromService(completionBlock: @escaping (ExperienceContent) -> Void) {
        
        if !(APIManager.isConnectedToNetwork()) {
            
            alertDelegate?.showOkButtonAlert(message: Constants.Message.noInternet, completionBlock: {
                self.reloadDataBlock()
            })
        }
        else {
            
            APIManager.getExperienceSummeryData { (success, result) in
                
                switch result {
                case .success(let response):
                    
                    if response.experienceSummery != nil {
                        
                        completionBlock(response)
                    }
                    else {
                        
                        completionBlock(ExperienceContent())
                        self.alertDelegate?.showOkButtonAlert(message: Constants.Message.somethinWrong, completionBlock: {
                            self.reloadDataBlock()
                        })
                    }
                    break
                case .failure:
                    
                    completionBlock(ExperienceContent())
                    self.alertDelegate?.showOkButtonAlert(message: Constants.Message.somethinWrong, completionBlock: {
                        self.reloadDataBlock()
                    })
                    break
                }
            }
        }
    }
}
