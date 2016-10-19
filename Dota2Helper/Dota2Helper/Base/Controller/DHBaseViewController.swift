//
//  DHBaseViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 10/19/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import ReachabilitySwift

class DHBaseViewController: UIViewController {

    lazy var reachability: Reachability = {
        return Reachability()
    }()!
    
    func reachabilityChanged(note: NSNotification) {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged),name: ReachabilityChangedNotification,object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
            DHLog("could not start reachability notifier")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: ReachabilityChangedNotification, object: reachability)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
