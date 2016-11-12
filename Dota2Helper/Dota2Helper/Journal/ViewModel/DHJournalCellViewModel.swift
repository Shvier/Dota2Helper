//
//  DHJournalCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 12/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHJournalCellViewModel: NSObject {
    
    let dataController: DHJournalCellDataController = DHJournalCellDataController.sharedInstance
    
    func refreshNews(_ callback: @autoclosure @escaping() -> Void) {
        dataController.getUpdates(success: { [unowned self] (response) in
            
        }, failure: {} ())
    }
    
}
