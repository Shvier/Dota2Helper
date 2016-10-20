//
//  DHJournalDataController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/25/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHJournalDataController: NSObject {

    lazy var journalDataSource: NSMutableArray? = {[]} ()
    
    func requestJournalDataWithCallback(callback: @autoclosure @escaping () -> Void) {
        let url = URL(string: kRefreshUpdatesUrl)
        DHNetworkRequestManager.sharedInstance.requestWithUrl(type: .DEFAULT, urlHeader: url, parameters: nil) { [unowned self] (Data, URLResponse, Error) in
            if Error == nil {
                do {
                    let result = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    let journalArray = result["news"]
                    self.journalDataSource?.removeAllObjects()
                    for journalDict in journalArray as! [NSDictionary] {
                        let updates: DHJournalModel = DHJournalModel()
                        updates.setValuesForKeys(journalDict as! [String : Any])
                        self.journalDataSource?.add(updates)
                    }
                    callback()
                } catch {
                    DHLog("catch:\(URLResponse!)")
                }
            } else {
                DHLog("error:\(Error!)")
            }
        }
    }
    
    func requestMoreJournal( callback: @autoclosure @escaping () -> Void) {
        let url = URL(string: kLoadMoreUpdatesUrl)
        let lastModel = journalDataSource![(journalDataSource?.count)! - 1] as! DHJournalModel
        let parameter: [String] = [lastModel.nid!]
        DHNetworkRequestManager.sharedInstance.requestWithUrl(type: .DEFAULT, urlHeader: url, parameters: parameter) { [unowned self] (Data, URLResponse, Error) in
            if Error == nil {
                do {
                    let result = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    let journalArray = result["news"]
                    for journalDict in journalArray as! [NSDictionary] {
                        let journal: DHJournalModel = DHJournalModel()
                        journal.setValuesForKeys(journalDict as! [String : Any])
                        self.journalDataSource?.add(journal)
                    }
                    callback()
                } catch {
                    DHLog("catch:\(URLResponse!)")
                }
            } else {
                DHLog("error:\(Error!)")
            }
        }
    }
    
    deinit {
        DHLog("JournalDataController deinit")
    }
    
}
