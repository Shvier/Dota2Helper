//
//  DHTutorialCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/30/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHTutorialCellViewModel: NSObject {

    var date: String?
    var title: String?
    var background: String?
    var nid: String?
    var tutorialDescription: String?
    
    init(tutorialModel: DHTutorialModel?) {
        super.init()
        
        self.date = tutorialModel?.date
        self.title = tutorialModel?.title
        self.background = tutorialModel?.background
        self.nid = tutorialModel?.nid
        self.tutorialDescription = tutorialModel?.tutorialDescription
    }
    
}
