//
//  DHJournalCellDetailViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 26/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHJournalCellDetailViewModel: NSObject {

    static let sharedInstance = DHJournalCellDetailViewModel()
    
    func getDetailUpdates(model: DHNewsModel, _ success: @escaping (_ urlString: String) -> Void, failure: @autoclosure @escaping () -> Void) {
    
    }
}
