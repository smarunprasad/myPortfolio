//
//  ProjectsDetailViewController.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 16/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class ProjectsDetailViewController:  BaseViewController {
    
    var project: Projects!
    var responsibility: [String]!
    var projectsDetailDataSource = ProjectsDetailDataSource()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = projectsDetailDataSource
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpUI()
        setUpModel()
    }
    
    func setUpUI() {
        
        self.navigationItem.title = Constants.Title.project
        self.tableView.tableFooterView = UIView()

    }
    
    func setUpModel() {
        
        self.responsibility = project.Responsibility
        self.projectsDetailDataSource.responsibilities = self.responsibility

            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
    }
}

extension ProjectsDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 35
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var aCell: UITableViewCell!
        aCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if aCell == nil {
            aCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        aCell.textLabel?.text =  "Responsibilities"
        aCell.selectionStyle = .none
        aCell.textLabel?.font =  UIFont.preferredFont(forTextStyle: .subheadline)
        aCell.backgroundColor = .groupTableViewBackground
        
        return aCell
    }
}
