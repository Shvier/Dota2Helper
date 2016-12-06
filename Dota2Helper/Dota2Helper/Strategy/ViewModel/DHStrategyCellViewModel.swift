//
//  DHStrategyCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/30/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHStrategyCellViewModel: NSObject {
    
    lazy var dataController: DHStrategyCellDataController = {
        return DHStrategyCellDataController()
    }()
    
    lazy var strategiesDataSource: [DHStrategyModel] = {
        return Array<DHStrategyModel>()
    }()
    
    func getAllStrategies(_ success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getAllStrategies(success: { [unowned self] (response) in
            do {
                guard let result = try? JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                guard let strategiesDicts = result?["strategies"] else {
                    throw DHUniformJSONError.DHJSONErrorKeyNotFound
                }
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource = strategiesDataSource
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
    
    func getNewerStrategies(_ success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getNewerStrategies(success: { [unowned self] (response) in
            do {
                guard let result = try? JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                guard let strategiesDicts = result?["strategies"] else {
                    throw DHUniformJSONError.DHJSONErrorKeyNotFound
                }
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource = strategiesDataSource
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
    
    func getStepStrategies(_ success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getStepStrategies(success: { [unowned self] (response) in
            do {
                guard let result = try? JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                guard let strategiesDicts = result?["strategies"] else {
                    throw DHUniformJSONError.DHJSONErrorKeyNotFound
                }
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource = strategiesDataSource
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
    
    func getSkillStrategies(_ success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getSkillStrategies(success: { [unowned self] (response) in
            do {
                guard let result = try? JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                guard let strategiesDicts = result?["strategies"] else {
                    throw DHUniformJSONError.DHJSONErrorKeyNotFound
                }
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource = strategiesDataSource
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
    
    func loadMoreAllStrategies(nid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreAllStrategies(nid: nid, success: { [unowned self] (response) in
            do {
                guard let result = try? JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                guard let strategiesDicts = result?["strategies"] else {
                    throw DHUniformJSONError.DHJSONErrorKeyNotFound
                }
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource.append(contentsOf: strategiesDataSource)
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
    
    func loadMoreNewerStrategies(nid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreNewerStrategies(nid: nid, success: { [unowned self] (response) in
            do {
                guard let result = try? JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                guard let strategiesDicts = result?["strategies"] else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource.append(contentsOf: strategiesDataSource)
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
    
    func loadMoreStepStrategies(nid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreStepStrategies(nid: nid, success: { [unowned self] (response) in
            do {
                guard let result = try? JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                guard let strategiesDicts = result?["strategies"] else {
                    throw DHUniformJSONError.DHJSONErrorKeyNotFound
                }
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource.append(contentsOf: strategiesDataSource)
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
    
    func loadMoreSkillStrategies(nid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreSkillStrategies(nid: nid, success: { [unowned self] (response) in
            do {
                guard let result = try? JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary else {
                    throw DHUniformJSONError.DHJSONErrorParseFailed
                }
                guard let strategiesDicts = result?["strategies"] else {
                    throw DHUniformJSONError.DHJSONErrorKeyNotFound
                }
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource.append(contentsOf: strategiesDataSource)
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
