//
//  DHTutorialCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/30/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHTutorialCellViewModel: NSObject {

    var tutorialModel: DHTutorialModel?
    var date: String?
    var title: String?
    var background: String?
    var nid: String?
    var tutorialDescription: String?
    
    init(tutorialModel: DHTutorialModel?) {
        super.init()
        
        self.tutorialModel = tutorialModel
        self.date = tutorialModel?.date
        self.title = tutorialModel?.title
        self.background = tutorialModel?.background
        self.nid = tutorialModel?.nid
        self.tutorialDescription = tutorialModel?.tutorialDescription
    }
    
    let dataController: DHTutorialCellDataController = DHTutorialCellDataController.sharedInstance

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
