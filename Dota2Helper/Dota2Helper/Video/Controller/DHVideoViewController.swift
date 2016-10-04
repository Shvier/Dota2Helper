//
//  DHVideoViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit

class DHVideoViewController: UITableViewController {

    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        navigationItem.title = "掌刀"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        
        let menu: UISegmentedMenu = UISegmentedMenu(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50), contentDataSource: [""], titleDataSource: ["全部", "解说", "比赛", "明星", "趣味", "新手"], type: .fill)
        view.addSubview(menu)
    }
    
}
