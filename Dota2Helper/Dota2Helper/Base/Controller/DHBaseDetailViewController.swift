//
//  DHBaseDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 10/14/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import WebKit

@objc class DHBaseDetailViewController: UIViewController {
    
    func handleNavigationBack() {
        let _ = navigationController?.popViewController(animated: true)
    }

    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.tintColor = kThemeColor
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationItem.title = "详情"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        handleNavigationBack()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initLifeCycle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
