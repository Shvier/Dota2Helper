//
//  DHTutorialViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit
import SimplerSegmentMenu

class DHTutorialViewController: UIViewController {
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationItem.title = "掌刀"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        let segmentedMenu = UISegmentedMenu(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height), contentDataSource: ["1"], titleDataSource: ["1", "2", "3"])
        self.view.addSubview(segmentedMenu)
    }
    
}
