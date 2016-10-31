//
//  DHJournalViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/26/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHJournalViewModel: NSObject {

    var journalDescription: String?
    var title: String?
    var nid: String?
    var background: String?
    var time: String?
    var date: String?
    var journalModel: DHJournalModel?
    
    init(journal: DHJournalModel) {
        self.journalDescription = journal.journalDescription
        self.title = journal.title
        self.nid = journal.nid
        self.background = journal.background
        self.time = journal.time
        self.date = journal.date
        self.journalModel = journal
    }

}
