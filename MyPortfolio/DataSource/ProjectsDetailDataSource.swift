//
//  ProjectsDetailDataSource.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

class ProjectsDetailDataSource: NSObject, UITableViewDataSource {
    
    var responsibilities = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responsibilities.isEmpty == false ? responsibilities.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var aCell: UITableViewCell!
        aCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if aCell == nil {
            aCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        aCell.selectionStyle = .none
        
        // To change the text based on the index
        aCell.textLabel?.text = responsibilities[indexPath.row]
        aCell.textLabel?.font =  UIFont.preferredFont(forTextStyle: .body)
        aCell.textLabel?.textColor = .black
        aCell.textLabel?.numberOfLines = 0
        
        return aCell
    }
}
