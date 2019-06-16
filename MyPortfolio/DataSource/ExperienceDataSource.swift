//
//  ExperienceDataSource.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import Foundation
import UIKit

class ExperienceDataSource: NSObject, UITableViewDataSource {
    
    var experienceSummery = [ExperienceSummery]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experienceSummery.isEmpty == false ? experienceSummery.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aCell = tableView.dequeueReusableCell(withIdentifier: ExperienceTableViewCell.identifier) as? ExperienceTableViewCell
        
        // Passing the value to cell
        aCell?.setupCellWithData(experienceSummery: experienceSummery[indexPath.row])
        return aCell!
    }
}
