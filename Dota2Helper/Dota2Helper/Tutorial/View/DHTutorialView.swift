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
    
    func bindDataWithViewModel(viewModel: DHTutorialViewModel) {
        self.tutorials = viewModel.tutorials
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
