//
//  EducationViewController.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class EducationViewController: BaseViewController {
    
    var educationViewModel: EducationViewModel!
    var educationDataSource = EducationDataSource()

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = educationDataSource
        }
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpUI()
        setUpModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.navigationItem.title = Constants.Title.education
        
        // To call the service if there is no data
        if educationViewModel.educationContant.education == nil {
            educationViewModel.getDataFromService()
        }
    }
    
    func setUpUI() {
        
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib.init(nibName: ExperienceTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ExperienceTableViewCell.identifier)
        
    }
    
    func setUpModel() {
        
        // Init the view model to download the data fro the API and pass back to screen
        self.view.showLoadingIndicator()
        educationViewModel = EducationViewModel()
        
        //Setting the alert delegate to show the alert ib Baseview controller
        educationViewModel.alertDelegate = self
        
        //get the data from the service
        educationViewModel.getDataFromService()
        
        //callBack block to update the view
        educationViewModel.reloadDataBlock = { [weak self] in
            
            // Pass the value to the datasouce and relode the table view
            self?.educationDataSource.educationContent = self?.educationViewModel.educationContant ?? EducationContent()
            self?.view.hideLoadingIndicator()
            
            DispatchQueue.main.async {
                
                self?.tableView.reloadData()
            }
        }
        
    }

}

extension EducationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 35
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var aCell: UITableViewCell!
        aCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if aCell == nil {
            aCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        switch section {
        case 0:
            aCell.textLabel?.text =  "Education"
        case 1:
            aCell.textLabel?.text =  "Certificate"
        default:
            aCell.textLabel?.text =  "Summery"
        }
        
        aCell.selectionStyle = .none
        aCell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        aCell.backgroundColor = .groupTableViewBackground
        
        return aCell
    }
}
