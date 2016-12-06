//
//  DHUpdatesCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 12/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHUpdatesCellViewModel: NSObject {
    
    lazy var dataController: DHUpdatesCellDataController = {
        return DHUpdatesCellDataController()
    }()
    
    lazy var updatesDataSource: [DHUpdateModel] = {
        return Array<DHUpdateModel>()
    }()
    
    func refreshUpdates(_ success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getUpdates(success: { [unowned self] (response) in
            do {
                guard let result = try? JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                guard let updatesArray = result?["news"] else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                
                var updatesDataSource: [DHUpdateModel] = Array<DHUpdateModel>()
                
                for updateDict in updatesArray as! [NSDictionary] {
                    let update: DHUpdateModel = DHUpdateModel(dictionary: updateDict)
                    updatesDataSource.append(update)
                }
                self.updatesDataSource = updatesDataSource
                success()
            } catch DHUniformJSONError.DHJSONErrorParseFailed {
                DHLog("JSON Parsing failed")
            } catch DHUniformJSONError.DHJSONErrorKeyNotFound {
                DHLog("Key not found in Dictionary")
            } catch let error {
                DHLog("Other Error: \(error)")
            }
        }, failure: failure)
    }
    
    func loadMoreUpdates(nid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreUpates(nid: nid, success: { [unowned self] (response) in
            do {
                guard let result = try? JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                guard let updatesArray = result?["news"] else {
                    throw DHUniformJSONError.DHJSONErrorKeyNotFound
                }
                
                var updatesDataSource: [DHUpdateModel] = Array<DHUpdateModel>()
                
                for updateDict in updatesArray as! [NSDictionary] {
                    let update: DHUpdateModel = DHUpdateModel(dictionary: updateDict)
                    updatesDataSource.append(update)
                }
                self.updatesDataSource.append(contentsOf: updatesDataSource)
                success()
            } catch DHUniformJSONError.DHJSONErrorParseFailed {
                DHLog("JSON Parsing failed")
            } catch DHUniformJSONError.DHJSONErrorKeyNotFound {
                DHLog("Key not found in Dictionary")
            } catch let error {
                DHLog("Other Error: \(error)")
            }
        }, failure: failure)
    }
    
}
