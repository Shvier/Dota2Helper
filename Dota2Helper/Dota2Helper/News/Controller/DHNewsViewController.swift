//
//  DHNewsViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit

class DHNewsViewController: UITableViewController {

    var dataController: DHNewsDataController?
    
    func handleNewsData() {
        dataController = DHNewsDataController()
        dataController?.requestNewsDataWithCallback(callback: {
            self.renderTableViewCell()
        }())
    }
    
    func renderTableViewCell() {
        
    }
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationItem.title = "掌刀"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        handleNewsData()
    }
    
}
