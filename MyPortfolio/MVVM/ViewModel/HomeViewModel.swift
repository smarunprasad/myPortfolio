//
//  HomeViewModel.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel {
    
    var reloadDataBlock: (() -> Void) = {
        
    }


    var alertDelegate: AlertDelegate?
    var professioinalContant: ProfessionalContent!
    var baseViewController: BaseViewController!
    
    func getDataFromService() {
        
        self.professioinalContant = ProfessionalContent()
        
        loadDatafromService { (_ model) in
            
            if model.professionalSummery != nil {
                
                self.professioinalContant = model
            }
            self.reloadDataBlock()
        }
    }
    
    private func loadDatafromService(completionBlock: @escaping (ProfessionalContent) -> Void) {
        
        if !(APIManager.isConnectedToNetwork()) {
            
            self.alertDelegate?.showOkButtonAlert(message: Constants.Message.noInternet, completionBlock: {
                self.reloadDataBlock()
            })
        }
        else {
            
            APIManager.getProfessionalSummeryData { (success, result) in
                
                switch result {
                case .success(let response):
                    
                    if response.professionalSummery != nil {
                        
                        completionBlock(response)
                    }
                    else {
                        
                        completionBlock(ProfessionalContent())
                        self.alertDelegate?.showOkButtonAlert(message: Constants.Message.somethinWrong, completionBlock: {
                        })
                    }
                    break
                case .failure:
                    
                    completionBlock(ProfessionalContent())
                    self.alertDelegate?.showOkButtonAlert(message: Constants.Message.somethinWrong, completionBlock: {
                    })
                    
                    break
                }
            }
        }
    }
}
