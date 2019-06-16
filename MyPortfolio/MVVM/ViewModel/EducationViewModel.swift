//
//  EducationViewModel.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

class EducationViewModel {
    
    init() {
        getDataFromService()
    }
    var reloadDataBlock: (() -> Void) = {
        
    }
    
    var alertDelegate: AlertDelegate?
    var educationContant: EducationContent!
    
    func getDataFromService() {
        
        self.educationContant = EducationContent()
        loadDatafromService { (_ model) in
            
            if model.education != nil {
                
                self.educationContant = model
            }
            self.reloadDataBlock()
        }
    }
    
    private func loadDatafromService(completionBlock: @escaping (EducationContent) -> Void) {
        
        if !(APIManager.isConnectedToNetwork()) {
            
            alertDelegate?.showOkButtonAlert(message: Constants.Message.noInternet)
            self.reloadDataBlock()
            return
        }
        
        APIManager.getEducationData { (success, result) in
            
            switch result {
            case .success(let response):
                
                if response.education != nil {
                    
                    completionBlock(response)
                }
                else {
                    
                    completionBlock(EducationContent())
                    self.alertDelegate?.showOkButtonAlert(message: Constants.Message.somethinWrong)
                }
                break
            case .failure:
                
                completionBlock(EducationContent())
                self.alertDelegate?.showOkButtonAlert(message: Constants.Message.somethinWrong)
                break
            }
        }
    }
}
