//
//  ExperienceTableViewCell.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 15/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {

    
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    static let identifier = "ExperienceTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellWithData(experienceSummery: ExperienceSummery) {

        //Profile image
       // companyImageView.showLoadingIndicator()
        companyImageView.download(urlString: experienceSummery.company_image!, placholderImage: UIImage.init(named: Constants.image.no_profile_image)!) { (success) in
         //   self.companyImageView.hideLoadingIndicator()
            
        }
        
        jobTitleLabel.text = experienceSummery.job_title
        companyNameLabel.text = experienceSummery.company_name
        durationLabel.text = "\(experienceSummery.start_date ?? "")  to  \(experienceSummery.end_date ?? "")"
    }
}
