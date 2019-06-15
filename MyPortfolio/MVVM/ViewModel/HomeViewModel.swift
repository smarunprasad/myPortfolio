//
//  HomeViewModel.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

protocol AlertDelegate {
    
    func showOkButtonAlert(title: String, message: String)
}
class HomeViewModel {
    
    init() {
        getDataFromService()
    }
    var reloadDataBlock: (() -> Void) = {
        
    }
    
    private var alertDelegate: AlertDelegate?
    var professioinalContant: ProfessionalContent!
    
    func getDataFromService() {
        
        loadDatafromService { (_ model) in
            
            if model.ProfessionalSummery != nil {
           
                self.professioinalContant = model
            }
            self.reloadDataBlock()
        }
    }
    
    private func loadDatafromService(completionBlock: @escaping (ProfessionalContent) -> Void) {
        
        if !(APIManager.isConnectedToNetwork()) {
            
            alertDelegate?.showOkButtonAlert(title: Constants.AppName.appName, message: Constants.Message.noInternet)
        }
        
        self.professioinalContant = ProfessionalContent()
        
        APIManager.getProfessionalSummeryData { (success, result) in
            
            switch result {
            case .success(let response):
                
                if response.ProfessionalSummery != nil {
                    
                    completionBlock(response)
                }
                else {
                    
                    completionBlock(ProfessionalContent())
                    self.alertDelegate?.showOkButtonAlert(title: Constants.AppName.appName, message: Constants.Message.somethinWrong)
                }
                break
            case .failure:
                
                completionBlock(ProfessionalContent())
                self.alertDelegate?.showOkButtonAlert(title: Constants.AppName.appName, message: Constants.Message.somethinWrong)
                break
            }
        }
    }
}
