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
            self.renderTableViewCell()
        }(), newsCell!)
    }
    
    func renderTableViewCell() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
