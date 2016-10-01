//
//  DHTutorialView.swift
//  Dota2Helper
//
//  Created by Shvier on 9/29/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHTutorialView: UIView {
    
    lazy var tutorials: NSArray? = {[]} ()
    var toolMenuView: UIScrollView?
    var tableView: UITableView?
    
    func bindDataWithViewModel(viewModel: DHTutorialViewModel) {
        self.tutorials = viewModel.tutorials
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView = UITableView(frame: frame, style: .grouped)
        self.addSubview(tableView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
