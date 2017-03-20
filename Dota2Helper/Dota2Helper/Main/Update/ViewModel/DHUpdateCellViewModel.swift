//
//  DHUpdateCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 12/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

class DHUpdateCellViewModel: NSObject {
    
    lazy var dataController: DHUpdateCellDataController = {
        return DHUpdateCellDataController()
    }()
    
    lazy var updateDataSource: [DHUpdateModel] = {
        return Array<DHUpdateModel>()
    }()
    
    func refreshUpdate(_ success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getUpdate(success: { [unowned self] (response) in
            do {
                guard let result = try? JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                guard let updateArray = result?["news"] else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                
                var updateDataSource: [DHUpdateModel] = Array<DHUpdateModel>()
                
                for updateDict in updateArray as! [NSDictionary] {
                    let update: DHUpdateModel = DHUpdateModel(dictionary: updateDict)
                    updateDataSource.append(update)
                }
                self.updateDataSource = updateDataSource
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
    
    func loadMoreUpdate(nid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreUpates(nid: nid, success: { [unowned self] (response) in
            do {
                guard let result = try? JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                guard let updateArray = result?["news"] else {
                    throw DHUniformJSONError.DHJSONErrorKeyNotFound
                }
                
                var updateDataSource: [DHUpdateModel] = Array<DHUpdateModel>()
                
                for updateDict in updateArray as! [NSDictionary] {
                    let update: DHUpdateModel = DHUpdateModel(dictionary: updateDict)
                    updateDataSource.append(update)
                }
                self.updateDataSource.append(contentsOf: updateDataSource)
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
