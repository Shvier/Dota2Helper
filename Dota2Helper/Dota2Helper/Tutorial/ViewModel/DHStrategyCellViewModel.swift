//
//  DHStrategyCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/30/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHStrategyCellViewModel: NSObject {
    
    let dataController: DHStrategyCellDataController = DHStrategyCellDataController.sharedInstance

    func getAllStrategies(_ success: @escaping (_ strategiesDataSource: [DHStrategyModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getAllStrategies(success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                success(strategiesDataSource)
            } catch {
                
            }
        }, failure: failure)
    }
    
    func getNewerStrategies(_ success: @escaping (_ strategiesDataSource: [DHStrategyModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getNewerStrategies(success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                success(strategiesDataSource)
            } catch {
                
            }
        }, failure: failure)
    }
    
    func getStepStrategies(_ success: @escaping (_ strategiesDataSource: [DHStrategyModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getStepStrategies(success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                success(strategiesDataSource)
            } catch {
                
            }
        }, failure: failure)
    }
    
    func getSkillStrategies(_ success: @escaping (_ strategiesDataSource: [DHStrategyModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.getSkillStrategies(success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                success(strategiesDataSource)
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreAllStrategies(nid: String, success: @escaping (_ strategiesDataSource: [DHStrategyModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreAllStrategies(nid: nid, success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                success(strategiesDataSource)
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreNewerStrategies(nid: String, success: @escaping (_ strategiesDataSource: [DHStrategyModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreNewerStrategies(nid: nid, success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                success(strategiesDataSource)
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreStepStrategies(nid: String, success: @escaping (_ strategiesDataSource: [DHStrategyModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreStepStrategies(nid: nid, success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                success(strategiesDataSource)
            } catch {
                
            }
        }, failure: failure)
    }
    
    func loadMoreSkillStrategies(nid: String, success: @escaping (_ strategiesDataSource: [DHStrategyModel]) -> Void, failure: @autoclosure @escaping () -> Void) {
        dataController.loadMoreSkillStrategies(nid: nid, success: { (response) in
            do {
                let result = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let strategiesDicts = result["strategies"]
                
                var strategiesDataSource: [DHStrategyModel] = Array<DHStrategyModel>()
                
                for strategyDict in strategiesDicts as! [NSDictionary] {
                    let strategy: DHStrategyModel = DHStrategyModel(dictionary: strategyDict)
                    strategiesDataSource.append(strategy)
                }
                success(strategiesDataSource)
            } catch {
                
            }
        }, failure: failure)
    }
    
}
