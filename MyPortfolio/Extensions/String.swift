//
//  String.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func openURL(completionBlock: @escaping (Bool) -> Void) {
        
        guard let url = URL.init(string: self) else {
            return
        }
        DispatchQueue.main.async {
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                completionBlock(success)
            })
        }
    }
    
    func capitalizingFirstLetter() -> String {
        
        return prefix(1).uppercased() + self.dropFirst().lowercased()
    }
    
    func addWhiteSpace() -> String {
        return "  \(self)"
    }
    func convertDateFormater() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"//1977-05-25T07:00:00Z
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = Constants.AppDateFormate.appDateFormate
        
        return  dateFormatter.string(from: date)
    }
}
