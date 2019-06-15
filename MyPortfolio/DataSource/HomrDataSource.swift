//
//  HomrDataSource.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 15/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

class HomeDataSource: NSObject, UITableViewDataSource {
    
    var professionalSummery = ProfessionalSummery()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return professionalSummery.name?.isEmpty == false ? (section == 3) ? 2 : 1 : 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return professionalSummery.name?.isEmpty == false ? 4 : 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch  indexPath.section {
            
        case 0:
            let aCell = tableView.dequeueReusableCell(withIdentifier: ProfessionalHeaderTableViewCell.identifier) as? ProfessionalHeaderTableViewCell
            
            aCell?.setupCellWithData(professionalSummery: professionalSummery)
            return aCell!
            
        case 1, 2:
            
            var aCell: UITableViewCell!
            aCell = tableView.dequeueReusableCell(withIdentifier: "cell")
            
            if aCell == nil {
                aCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
           aCell.selectionStyle = .none
            
            // To change the text based on the index
            aCell.textLabel?.text = (indexPath.section == 1) ? professionalSummery.describtion : professionalSummery.status
            aCell.textLabel?.font =  UIFont.preferredFont(forTextStyle: .body)
            aCell.textLabel?.textColor = .gray
            aCell.textLabel?.numberOfLines = 0
            
            return aCell

        default:
            let aCell = tableView.dequeueReusableCell(withIdentifier: SalaryTableViewCell.identifier) as? SalaryTableViewCell
          
            guard let salary = professionalSummery.salary?[indexPath.row] else { return aCell! }
            aCell?.setupCellWithData(salary: salary)
            return aCell!
        }
        
    }
    
    
    
    
}
