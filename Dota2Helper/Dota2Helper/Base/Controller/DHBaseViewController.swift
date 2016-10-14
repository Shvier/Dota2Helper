//
//  DHBaseViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 10/14/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHBaseViewController: UIViewController, UIGestureRecognizerDelegate {

    func handleNavigationBack() {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func addPanGesture() {
        let pan: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(DHBaseViewController.handleNavigationBack))
        pan.delegate = self
        view.addGestureRecognizer(pan)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        let leftBarItem: UIBarButtonItem = UIBarButtonItem(title: "返回", style: .done, target: self, action: #selector(self.handleNavigationBack))
        leftBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: kThemeColor], for: .normal)
        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.title = "详情"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initLifeCycle()
        addPanGesture()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
