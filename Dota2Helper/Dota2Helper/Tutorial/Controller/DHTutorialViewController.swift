//
//  DHTutorialViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit

class DHTutorialViewController: UITableViewController {
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        navigationItem.title = "掌刀"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        
        let menu: UISegmentedMenu = UISegmentedMenu(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50), contentDataSource: [""], titleDataSource: ["全部", "新手", "进阶", "技巧"], type: .fill)
        view.addSubview(menu)
    }
    
}
