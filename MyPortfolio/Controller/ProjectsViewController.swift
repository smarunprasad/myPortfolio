//
//  ProjectsViewController.swift
//  MyPortfolio
//
//  Created by Arunprasat Selvaraj on 14/06/2019.
//  Copyright © 2019 Arunprasat Selvaraj. All rights reserved.
//

import UIKit

class ProjectsViewController:  BaseViewController {
    
    var projectsViewModel: ProjectViewModel!
    var projectsDataSource = ProjectsDataSource()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = projectsDataSource
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
        self.tableView.register(UINib.init(nibName: ProjectsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ProjectsTableViewCell.identifier)
        
    }
    
    func setUpModel() {
        
        self.view.showLoadingIndicator()
        projectsViewModel = ProjectViewModel.init()
        projectsViewModel.alertDelegate = self
        projectsViewModel.reloadDataBlock = {
            
            self.projectsDataSource.projects = self.projectsViewModel.projectsContant.projects ?? [Projects]()
            self.view.hideLoadingIndicator()
            
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
        }
    }
    
    func moveToDetailScreen(result: Projects) {
        
        let aViewController: ProjectsDetailViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProjectsDetailViewController") as! ProjectsDetailViewController
        aViewController.project = result
        
        self.navigationController?.pushViewController(aViewController, animated: true)
    }
}

extension ProjectsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let projects = self.projectsViewModel.projectsContant.projects {
            self.moveToDetailScreen(result: projects[indexPath.row])
        }
    }
}
