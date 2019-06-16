//
//  SkillsDataSource.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

class SkillsDataSource: NSObject, UITableViewDataSource {
    
    var skills = Skills()
    
    func laodDataToRow(section: Int) -> [String] {
        
        switch section {
        case 0:
            return skills.development_tools
        case 1:
            return skills.Programing_launguage
        case 2:
            return skills.Designing
        case 3:
            return skills.Frameworks
        case 4:
            return skills.API
        case 5:
            return skills.DataBase
        case 6:
            return skills.Software_development_methodologies
        case 7:
            return skills.Version_controller
        default:
            return [String]()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return skills.development_tools.count
        case 1:
            return skills.Programing_launguage.count
        case 2:
            return skills.Designing.count
        case 3:
            return skills.Frameworks.count
        case 4:
            return skills.API.count
        case 5:
            return skills.DataBase.count
        case 6:
            return skills.Software_development_methodologies.count
        case 7:
            return skills.Version_controller.count
        default:
            return 1
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return skills.development_tools != nil ? 8 : 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var aCell: UITableViewCell!
        aCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if aCell == nil {
            aCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        aCell.selectionStyle = .none
        
        // To change the text based on the index
        switch indexPath.section {
        case 0:
            aCell.textLabel?.text = skills.development_tools[indexPath.row]
        case 1:
            aCell.textLabel?.text = skills.Programing_launguage[indexPath.row]
        case 2:
            aCell.textLabel?.text = skills.Designing[indexPath.row]
        case 3:
            aCell.textLabel?.text = skills.Frameworks[indexPath.row]
        case 4:
            aCell.textLabel?.text = skills.API[indexPath.row]
        case 5:
            aCell.textLabel?.text = skills.DataBase[indexPath.row]
        case 6:
            aCell.textLabel?.text = skills.Software_development_methodologies[indexPath.row]
        case 7:
            aCell.textLabel?.text = skills.Version_controller[indexPath.row]
        default:
            aCell.textLabel?.text = skills.Misc
        }
        
        aCell.textLabel?.font =  UIFont.preferredFont(forTextStyle: .subheadline)
        aCell.textLabel?.numberOfLines = 0
        
        return aCell
    }
}
