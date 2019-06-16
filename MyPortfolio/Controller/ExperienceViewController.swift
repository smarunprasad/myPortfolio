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
    
    func setUpUI() {
        
        self.navigationItem.title = Constants.Title.experience
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib.init(nibName: ExperienceTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ExperienceTableViewCell.identifier)

    }
    
    func setUpModel() {
        
        self.view.showLoadingIndicator()
        experienceViewModel = ExperienceViewModel.init()
        experienceViewModel.alertDelegate = self
        experienceViewModel.reloadDataBlock = {
            
            self.experienceDataSource.experienceSummery = self.experienceViewModel.experienceContant.experienceSummery ?? [ExperienceSummery]()
            self.view.hideLoadingIndicator()
            
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
        }

    }
}
