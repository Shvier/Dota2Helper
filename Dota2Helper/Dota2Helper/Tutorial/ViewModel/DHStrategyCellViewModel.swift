//
//  DHStrategyCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/30/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHStrategyCellViewModel: NSObject {

    var strategyModel: DHStrategyModel?
    var date: String?
    var title: String?
    var background: String?
    var nid: String?
    var strategyDescription: String?
    
    init(strategyModel: DHStrategyModel?) {
        super.init()
        
        self.strategyModel = strategyModel
        self.date = strategyModel?.date
        self.title = strategyModel?.title
        self.background = strategyModel?.background
        self.nid = strategyModel?.nid
        self.strategyDescription = strategyModel?.strategyDescription
    }
    
    let dataController: DHStrategyCellDataController = DHStrategyCellDataController.sharedInstance

    func getAllStrategies(_ callback: @autoclosure @escaping () -> Void) {
        dataController.getAllStrategies(success: { [unowned self] (response) in
        
            }, failure: {} ())
    }
    
    func getNewerStrategies(_ callback: @autoclosure @escaping () -> Void) {
        dataController.getNewerStrategies(success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func getStepStrategies(_ callback: @autoclosure @escaping () -> Void) {
        dataController.getStepStrategies(success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func getSkillStrategies(s_ callback: @autoclosure @escaping () -> Void) {
        dataController.getSkillStrategies(success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func loadMoreAllStrategies(nid: String, _ callback: @autoclosure @escaping () -> Void) {
        dataController.loadMoreAllStrategies(nid: nid, success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func loadMoreNewerStrategies(nid: String, _ callback: @autoclosure @escaping () -> Void) {
        dataController.loadMoreNewerStrategies(nid: nid, success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func loadMoreStepStrategies(nid: String, _ callback: @autoclosure @escaping () -> Void) {
        dataController.loadMoreStepStrategies(nid: nid, success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func loadMoreSkillStrategies(nid: String, _ callback: @autoclosure @escaping () -> Void) {
        dataController.loadMoreSkillStrategies(nid: nid, success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
    func getStrategiesDetail(date: String, nid: String, _ callback: @autoclosure @escaping () -> Void) {
        dataController.getStrategiesDetail(date: date, nid: nid, success: { [unowned self] (response) in
            
            }, failure: {} ())
    }
    
}
