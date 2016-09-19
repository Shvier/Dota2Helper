//
//  DHNewsViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit

class DHNewsViewController: UITableViewController {

    func HandleData() {
        let url = URL(string: kRefreshNewsUrl)
        let dataTask: URLSessionDataTask = URLSession.shared.dataTask(with: url!) { (Data, URLResponse, Error) in
            print(Data)
        }
        dataTask.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationItem.title = "掌刀"
        
        HandleData()
    }
    
}
