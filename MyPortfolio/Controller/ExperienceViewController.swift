//
//  ExperienceViewController.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class ExperienceViewController: BaseViewController {

    var experienceViewModel: ExperienceViewModel!
    var experienceDataSource = ExperienceDataSource()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = experienceDataSource
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpUI()
        setUpModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.navigationItem.title = Constants.Title.experience
        
        // To call the service if there is no data
        if experienceViewModel.experienceContant.experienceSummery == nil {
            experienceViewModel.getDataFromService()
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
        experienceViewModel = ExperienceViewModel()
        
        //Setting the alert delegate to show the alert in Base view controller
        experienceViewModel.alertDelegate = self
        
        //get the data from the service
        experienceViewModel.getDataFromService()
        
        //callBack block to update the view
        experienceViewModel.reloadDataBlock = { [weak self] in
            
            // Pass the value to the datasouce and relode the table view
            self?.experienceDataSource.experienceSummery = self?.experienceViewModel.experienceContant.experienceSummery ?? [ExperienceSummery]()
            self?.view.hideLoadingIndicator()
            
            DispatchQueue.main.async {
                
                self?.tableView.reloadData()
            }
        }

    }
}
