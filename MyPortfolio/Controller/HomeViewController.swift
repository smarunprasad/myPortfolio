//
//  HomeViewController.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

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
    
    func setUpUI() {
        
        self.title = Constants.Title.home
        self.tableView.register(UINib.init(nibName: ProfessionalHeaderTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ProfessionalHeaderTableViewCell.identifier)
        self.tableView.register(UINib.init(nibName: SalaryTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SalaryTableViewCell.identifier)
        //self.tableView.register(UINib.init(nibName: "cell", bundle: nil), forCellReuseIdentifier: "cell")

    }
    
    func setUpModel() {

        
        homeViewModel = HomeViewModel.init()
        homeViewModel.reloadDataBlock = {
            
            self.homeDataSource.professionalSummery = self.homeViewModel.professioinalContant.ProfessionalSummery ?? ProfessionalSummery()
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
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
