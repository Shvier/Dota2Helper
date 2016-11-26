//
//  DHUpdatesCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 12/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHUpdatesCellViewModel: NSObject {
    
    let dataController: DHUpdatesCellDataController = DHUpdatesCellDataController.sharedInstance
    
    func refreshUpdates(_ success: @escaping (_ updatesArray: [DHUpdateModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getUpdates(success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let updatesArray = result["news"]
                
                var updatesDataSource: [DHUpdateModel] = Array<DHUpdateModel>()
                
                for updateDict in updatesArray as! [NSDictionary] {
                    let update: DHUpdateModel = DHUpdateModel(dictionary: updateDict)
                    updatesDataSource.append(update)
                }
                success(updatesDataSource)
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreUpdates(nid: String, success: @escaping (_ updatesArray: [DHUpdateModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreUpates(nid: nid, success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let updatesArray = result["news"]
                
                var updatesDataSource: [DHUpdateModel] = Array<DHUpdateModel>()
                
                for updateDict in updatesArray as! [NSDictionary] {
                    let update: DHUpdateModel = DHUpdateModel(dictionary: updateDict)
                    updatesDataSource.append(update)
                }
                success(updatesDataSource)
            } catch {
                
            }
        }, failure: failure)
    }
    
}
