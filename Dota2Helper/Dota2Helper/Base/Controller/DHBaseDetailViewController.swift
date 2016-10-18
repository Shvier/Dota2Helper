//
//  DHBaseDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 10/14/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import WebKit

class DHBaseDetailViewController: UIViewController, UIGestureRecognizerDelegate, WKNavigationDelegate {

    var webView: WKWebView?
    
    func handleNavigationBack() {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func addPanGesture() {
        let pan: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(DHBaseDetailViewController.handleNavigationBack))
        pan.delegate = self
        view.addGestureRecognizer(pan)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    convenience init() {
        self.init()
    }
    
    init(webView: WKWebView) {
        DHBaseDetailViewController.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        let leftBarItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "left_bar_item")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(self.handleNavigationBack))
        leftBarItem.tintColor = kThemeColor
        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.title = "详情"
        
        webView?.navigationDelegate = self
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
