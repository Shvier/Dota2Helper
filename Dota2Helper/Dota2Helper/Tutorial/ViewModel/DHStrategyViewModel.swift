//
//  DHStrategyViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/29/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHStrategyViewModel: NSObject {

    lazy var tutorials: NSArray? = {[]} ()

    init(tutorials: NSArray?) {
        super.init()
        
        self.tutorials = tutorials
    }
    
}
