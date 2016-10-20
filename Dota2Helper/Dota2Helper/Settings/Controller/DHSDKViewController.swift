//
//  DHSDKViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 10/20/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHSDKViewController: UITableViewController {

    let dataSource: [NSDictionary] = [
        ["name": "Bugtags", "author": "北京八哥科技有限责任公司", "url": "https://www.bugtags.com/"],
        ["name": "Fabric", "author": "Twitter, Inc.", "url": "https://get.fabric.io/"],
        ["name": "Kingfisher", "author": "@onevcat", "url": "https://github.com/onevcat/Kingfisher"],
        ["name": "MJRefresh", "author": "@CoderMJLee", "url": "https://github.com/CoderMJLee/MJRefresh"],
        ["name": "Reachability.Swift", "author": "@ashleymills", "url": "https://github.com/ashleymills/Reachability.swift"],
        ["name": "SDCycleScrollView", "author":"@gsdios", "url": "https://github.com/gsdios/SDCycleScrollView"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = kThemeColor
        tableView?.register(UINib(nibName: "DHSDKTableViewCell", bundle: nil), forCellReuseIdentifier: kSDKCellReuseIdentifier)
        tableView.tableFooterView = UIView()
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// MARK: - UITableViewDelegate
extension DHSDKViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let dict: NSDictionary = dataSource[indexPath.row]
        UIApplication.shared.openURL(URL(string: dict["url"] as! String)!)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kSDKCellReuseIdentifier, for: indexPath) as! DHSDKTableViewCell
        let dict: NSDictionary = dataSource[indexPath.row]
        cell.sdkNameLabel.text = dict["name"] as? String
        cell.authorNameLabel.text = dict["author"] as? String
        return cell
    }
}
