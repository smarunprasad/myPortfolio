//
//  HomeViewController.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    var homeViewModel: HomeViewModel!
    var homeDataSource = HomeDataSource()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = homeDataSource
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpUI()
        setUpModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.navigationItem.title = Constants.Title.home
        
        // To call the service if there is no data
        if homeViewModel.professioinalContant.professionalSummery?.name == nil {
            homeViewModel.getDataFromService()
        }
    }
    
    func setUpUI() {
        
        //Setup tableview
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib.init(nibName: ProfessionalHeaderTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ProfessionalHeaderTableViewCell.identifier)
        self.tableView.register(UINib.init(nibName: SalaryTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SalaryTableViewCell.identifier)

    }
    
    func setUpModel() {

        // Init the view model to download the data fro the API and pass back to screen
        self.view.showLoadingIndicator()
        homeViewModel = HomeViewModel()
        
        //Setting the alert delegate to show the alert in Base view controller
        homeViewModel.alertDelegate = self
        
        //get the data from the service
        homeViewModel.getDataFromService()

        //callBack block to update the view
        homeViewModel.reloadDataBlock = { [weak self] in
            
            // Pass the value to the datasouce and relode the table view
            self?.homeDataSource.professionalSummery = self?.homeViewModel.professioinalContant.professionalSummery ?? ProfessionalSummery()
            self?.view.hideLoadingIndicator()

            DispatchQueue.main.async {
                
                self?.tableView.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return (section == 0) ? 0 : 35
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var aCell: UITableViewCell!
        aCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if aCell == nil {
            aCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        // seting the section tile based on the data
        switch section {
        case 0:
            return UIView()
        case 1:
            aCell.textLabel?.text =  "Describtion"
        case 2:
            aCell.textLabel?.text =  "Status"
        default:
            aCell.textLabel?.text =  "Salary"
        }
        aCell.selectionStyle = .none
        aCell.textLabel?.font =  UIFont.preferredFont(forTextStyle: .subheadline)
        aCell.backgroundColor = .groupTableViewBackground
        
        return aCell
    }
}
