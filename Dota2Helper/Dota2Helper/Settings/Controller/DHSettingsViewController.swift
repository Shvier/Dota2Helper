//
//  DHSettingsViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit

class DHSettingsViewController: UITableViewController {

    lazy var dataSource: [String]? = {[]} ()
    
    func handleData() {
        dataSource = ["", "观看记录", "缓存视频", "清空缓存"]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataSource?.count)!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        } else {
            return 30
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kSettingCellReuseIdentifier, for: indexPath)
        if indexPath.row == 0 {
            cell.imageView?.image = UIImage(named: "setting_background")
        } else {
            cell.textLabel?.text = dataSource?[indexPath.row]
        }
        return cell
    }
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        navigationItem.title = "掌刀"
    }
    
    func setContentView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kSettingCellReuseIdentifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        setContentView()
        handleData()
    }
    
}
