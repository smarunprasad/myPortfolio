//
//  ProjectsTableViewCell.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class ProjectsTableViewCell: UITableViewCell {

    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    static let identifier = "ProjectsTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellWithData(projects: Projects) {
        
        appNameLabel.text = projects.project_title
        companyNameLabel.text = projects.client
        durationLabel.text = "\(projects.start_date ?? "")  to  \(projects.end_date ?? "")"
    }
}
