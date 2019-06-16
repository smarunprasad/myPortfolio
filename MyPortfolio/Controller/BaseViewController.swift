//
//  BaseViewController.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit


protocol AlertDelegate {
    
    func showOkButtonAlert(message: String)
}

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
}

extension BaseViewController: AlertDelegate {
    
    func showOkButtonAlert(message: String) {
        
        self.showAlert(title:Constants.AppName.appName, message: message, OkButtonBlock: {
          
        })
        
    }
}
