//
//  SalaryTableViewCell.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 15/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class SalaryTableViewCell: UITableViewCell {

    static let identifier = "SalaryTableViewCell"
    
    @IBOutlet weak var salaryTypeLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var sponsorLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellWithData(salary: Salary) {
        
        salaryTypeLabel.text = salary.type
        
        if salary.type == "Contract" {
            
            sponsorLabel.text = "Visa valid till 2022"
            if let rate = salary.rate { rateLabel.text = "\(rate)/day" }
        }
        else {
            
            sponsorLabel.text = "Sponsorship required"
            if let rate = salary.rate { rateLabel.text = "\(rate)/annum" }
        }
    }
}
