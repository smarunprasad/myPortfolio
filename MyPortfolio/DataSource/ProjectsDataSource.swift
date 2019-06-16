//
//  ProjectsDataSource.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

class ProjectsDataSource: NSObject, UITableViewDataSource {
    
    var projects = [Projects]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.isEmpty == false ? projects.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aCell = tableView.dequeueReusableCell(withIdentifier: ProjectsTableViewCell.identifier) as? ProjectsTableViewCell
        
        aCell?.setupCellWithData(projects: projects[indexPath.row])
        return aCell!
    }
}
