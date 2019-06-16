//
//  EducationDataSource.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

class EducationDataSource: NSObject, UITableViewDataSource {
    
    var educationContent = EducationContent()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return educationContent.education != nil ? 3 : 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return educationContent.education != nil ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aCell = tableView.dequeueReusableCell(withIdentifier: ExperienceTableViewCell.identifier) as? ExperienceTableViewCell
        
        // Using the same ExperienceTableViewCell for the education & certificate data list
        switch indexPath.section {
        case 0:
            if let education = educationContent.education {
                aCell?.setupCellWithEducationData(eduction: education)
            }
        case 1:
            if let certificate = educationContent.certificate {
                aCell?.setupCellWithCertificateData(certificate: certificate)
            }
        default:
            var aCell: UITableViewCell!
            aCell = tableView.dequeueReusableCell(withIdentifier: "cell")
            
            if aCell == nil {
                aCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            aCell.selectionStyle = .none
            
            // To change the text based on the index
            aCell.textLabel?.text = educationContent.Summery
            aCell.textLabel?.font =  UIFont.preferredFont(forTextStyle: .body)
            aCell.textLabel?.textColor = .black
            aCell.textLabel?.numberOfLines = 0
            
            return aCell
        }
        
        return aCell!
    }
}
