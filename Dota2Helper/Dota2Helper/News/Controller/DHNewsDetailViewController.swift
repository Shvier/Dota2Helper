//
//  DHNewsDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/22/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHNewsDetailViewController: UIViewController {

    var newsCell: DHNewsTableViewCell?
    var dataController: DHNewsDetailDataController?
    
    func handleData() {
        dataController?.requestNewsDetailDataWithCallback(callback: {
            self.renderWebView()
        }(), newsCell!)
    }
    
    func renderWebView() {
        
    }
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationItem.title = "详情"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
