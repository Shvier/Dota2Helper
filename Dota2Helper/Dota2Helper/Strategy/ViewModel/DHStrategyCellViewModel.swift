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
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource = strategiesDataSource
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func getNewerStrategies(_ success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getNewerStrategies(success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource = strategiesDataSource
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func getStepStrategies(_ success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getStepStrategies(success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource = strategiesDataSource
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func getSkillStrategies(_ success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getSkillStrategies(success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource = strategiesDataSource
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreAllStrategies(nid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreAllStrategies(nid: nid, success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource.append(contentsOf: strategiesDataSource)
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreNewerStrategies(nid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreNewerStrategies(nid: nid, success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource.append(contentsOf: strategiesDataSource)
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreStepStrategies(nid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreStepStrategies(nid: nid, success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource.append(contentsOf: strategiesDataSource)
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreSkillStrategies(nid: String, success: @autoclosure @escaping () -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreSkillStrategies(nid: nid, success: { [unowned self] (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                self.strategiesDataSource.append(contentsOf: strategiesDataSource)
                success()
            } catch {
                
            }
        }, failure: failure)
    }
    
}
