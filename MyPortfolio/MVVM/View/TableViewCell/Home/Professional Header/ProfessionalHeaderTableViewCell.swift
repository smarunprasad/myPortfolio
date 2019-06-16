//
//  ProfessionalHeaderTableViewCell.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 15/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class ProfessionalHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var bacgroundImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sortDescribtionLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    
    static let identifier = "ProfessionalHeaderTableViewCell"
    var alertDelegate: AlertDelegate?
    var professionalSummery: ProfessionalSummery!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.roundCorner(radius: profileImageView.frame.size.width/2 , borderColor: .lightGray)
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func callButtonTapped(_ sender: Any) {
        
        let aUrlString = self.professionalSummery.mobile_number
        aUrlString?.openURL(completionBlock: { [weak self](success) in
            
            if !(success) {
                self?.alertDelegate?.showOkButtonAlert(message: Constants.Message.simulator, completionBlock: {
                    
                })
            }
        })
    }
    
    func setupCellWithData(professionalSummery: ProfessionalSummery) {
        
        self.professionalSummery = professionalSummery
        
        //Profile image
        profileImageView.download(urlString: professionalSummery.profile_picture!, placholderImage: UIImage.init(named: Constants.image.no_profile_image)!) { (success) in

        }
        
        //bacgroundImageView image
        bacgroundImageView.contentMode = .scaleAspectFill
        bacgroundImageView.download(urlString: professionalSummery.background_picture!, completionBlock: nil)
        
        //Details
        nameLabel.text = professionalSummery.name
        sortDescribtionLabel.text = professionalSummery.summery
        companyNameLabel.text = professionalSummery.current_company
        lastUpdateLabel.text = professionalSummery.last_updated_on!.convertDateFormater()
    }
}
