//
//  TimeInterval.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    func stringFromTimeInterval() -> String {
        
        let time = Int(self)
        
        let minutes = time % 60
        let hours = (time / 60) % 60
        var aString = ""
        
        if hours == 0 && minutes == 0 {
            return ""
        }
        else if hours == 0 {
            aString = String(format: "%0.2d min",minutes)
        }
        else if minutes == 0 {
            aString = String(format: "%0.2d hrs",hours)
        }
        else {
            aString = String(format: "%0.2d hrs %0.2d min",hours,minutes)
        }
        
        return aString
    }
}
