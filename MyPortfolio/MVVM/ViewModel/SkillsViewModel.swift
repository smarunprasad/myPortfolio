//
//  SkillsViewModel.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

class SkillsViewModel {
    
    init() {
        getDataFromService()
    }
    var reloadDataBlock: (() -> Void) = {
        
    }
    
    var alertDelegate: AlertDelegate?
    var skillsContant: SkillsContent!
    
    func getDataFromService() {
        
        self.skillsContant = SkillsContent()
        loadDatafromService { (_ model) in
            
            if model.skills != nil {
                
                self.skillsContant = model
            }
            self.reloadDataBlock()
        }
    }
    
    private func loadDatafromService(completionBlock: @escaping (SkillsContent) -> Void) {
        
        if !(APIManager.isConnectedToNetwork()) {
            
            alertDelegate?.showOkButtonAlert(message: Constants.Message.noInternet)
            self.reloadDataBlock()
            return
        }
        
        APIManager.getSkillsData { (success, result) in
            
            switch result {
            case .success(let response):
                
                if response.skills != nil {
                    
                    completionBlock(response)
                }
                else {
                    
                    completionBlock(SkillsContent())
                    self.alertDelegate?.showOkButtonAlert(message: Constants.Message.somethinWrong)
                }
                break
            case .failure:
                
                completionBlock(SkillsContent())
                self.alertDelegate?.showOkButtonAlert(message: Constants.Message.somethinWrong)
                break
            }
        }
    }
}
