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
        
        let menu: UISegmentedMenu = UISegmentedMenu(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50), contentDataSource: [""], titleDataSource: ["首页", "文章", "好东西", "早点与宵夜", "电子小物", "苹果", "收纳集合", "JBL", "装b利器", "测试机啦啦", "乱七八糟的"])
        view.addSubview(menu)
    }
    
}
