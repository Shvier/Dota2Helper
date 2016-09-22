//
//  DHNewsDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/22/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import WebKit

class DHNewsDetailViewController: UIViewController {

    var newsCell: DHNewsTableViewCell?
    var dataController: DHNewsDetailDataController?
    var webView: WKWebView?
    
    func handleData() {
        let request: URLRequest = (dataController?.requestNewsDetailDataUrlWithNewsCell(newsCell!))!
        webView?.load(request)
    }
    
    func renderWebView() {
        
    }
    
    func setContentView() {
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
