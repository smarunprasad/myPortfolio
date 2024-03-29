//
//  SkillsViewController.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class SkillsViewController: BaseViewController {
    
    var skillsViewModel: SkillsViewModel!
    var skillsDataSource = SkillsDataSource()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = skillsDataSource
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpUI()
        setUpModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.navigationItem.title = Constants.Title.skills
        
        // To call the service if there is no data
        if skillsViewModel.skillsContant.skills == nil {
            skillsViewModel.getDataFromService()
        }
    }
    
    func setUpUI() {
        
        self.tableView.tableFooterView = UIView()

    }
    
    func setUpModel() {
        
        // Init the view model to download the data fro the API and pass back to screen
        self.view.showLoadingIndicator()
        skillsViewModel = SkillsViewModel()
        
        //Setting the alert delegate to show the alert in Base view controller
        skillsViewModel.alertDelegate = self
        
        //get the data from the service
        skillsViewModel.getDataFromService()
        
        //callBack block to update the view
        skillsViewModel.reloadDataBlock = { [weak self] in
            
            // Pass the value to the datasouce and relode the table view
            self?.skillsDataSource.skills = self?.skillsViewModel.skillsContant.skills ?? Skills()
            self?.view.hideLoadingIndicator()
            
            DispatchQueue.main.async {
                
                self?.tableView.reloadData()
            }
        }
    }
}

extension SkillsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 35
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var aCell: UITableViewCell!
        aCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if aCell == nil {
            aCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        // setting the tile for the skills
        switch section {
            
        case 0:
            aCell.textLabel?.text =  "Development tools"
        case 1:
            aCell.textLabel?.text =  "Programing launguage"
        case 2:
            aCell.textLabel?.text =  "Designing"
        case 3:
            aCell.textLabel?.text =  "Frameworks"
        case 4:
            aCell.textLabel?.text =  "Design tools"
        case 5:
            aCell.textLabel?.text =  "API"
        case 6:
            aCell.textLabel?.text =  "DataBase"
        case 7:
            aCell.textLabel?.text =  "Software development methodologies"
        default:
            aCell.textLabel?.text =  "MISC"
        }
        aCell.selectionStyle = .none
        aCell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        aCell.backgroundColor = .groupTableViewBackground
        
        return aCell
    }
}
