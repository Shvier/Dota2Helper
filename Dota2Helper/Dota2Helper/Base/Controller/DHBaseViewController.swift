//
//  DHBaseViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 10/19/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Reachability

class DHBaseViewController: UIViewController {

    lazy var reachability: Reachability = {
        return Reachability()
    }()!
    
    @objc func reachabilityChanged(note: NSNotification) {

    }
    
    func setNaviAndTabStatus(isHidden: Bool) {
        self.navigationController?.setNavigationBarHidden(isHidden, animated: true)
        self.hidesBottomBarWhenPushed = isHidden
        self.tabBarController?.tabBar.isHidden = isHidden
    }
    
    func setView() {
        view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.tabBarController?.tabBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: kTabBarItemColor]
        navigationItem.title = "掌刀"
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged),name: Notification.Name.reachabilityChanged,object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
            DHLog("could not start reachability notifier")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: Notification.Name.reachabilityChanged, object: reachability)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
