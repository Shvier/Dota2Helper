//
//  AppDelegate.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        let tabBarVC: UITabBarController = UITabBarController()
        let newsVC: DHNewsViewController = DHNewsViewController()
        let newsNaVC: UINavigationController = UINavigationController(rootViewController: newsVC)
        newsVC.tabBarItem = UITabBarItem(title: "资讯", image: UIImage(named: "tabbar_icon_news")?.withRenderingMode(.alwaysOriginal), tag: 1001)
        
        let videoVC: DHVideoViewController = DHVideoViewController()
        let videoNaVC: UINavigationController = UINavigationController(rootViewController: videoVC)
        videoVC.tabBarItem = UITabBarItem(title: "视频", image: UIImage(named: "tabbar_icon_video")?.withRenderingMode(.alwaysOriginal), tag: 1002)
        
        let tutorialVC: DHTutorialViewController = DHTutorialViewController()
        let tutorialNaVC: UINavigationController = UINavigationController(rootViewController: tutorialVC)
        tutorialVC.tabBarItem = UITabBarItem(title: "攻略", image: UIImage(named: "tabbar_icon_tutorial")?.withRenderingMode(.alwaysOriginal), tag: 1003)
        
        let journalVC: DHJournalViewController = DHJournalViewController()
        let journalNaVC: UINavigationController = UINavigationController(rootViewController: journalVC)
        journalVC.tabBarItem = UITabBarItem(title: "更新", image: UIImage(named: "tabbar_icon_journal")?.withRenderingMode(.alwaysOriginal), tag: 1004)
        
        let settingsVC: DHSettingsViewController = DHSettingsViewController()
        let settingsNaVC: UINavigationController = UINavigationController(rootViewController: settingsVC)
        settingsNaVC.tabBarItem = UITabBarItem(title: "其它", image: UIImage(named: "tabbar_icon_settings")?.withRenderingMode(.alwaysOriginal), tag: 1005)

        tabBarVC.viewControllers = [newsNaVC, videoNaVC, tutorialNaVC, journalNaVC, settingsNaVC]
        
        tabBarVC.tabBar.tintColor = UIColor.red
        tabBarVC.tabBar.isTranslucent = false
        tabBarVC.tabBar.barStyle = .black
        self.window?.rootViewController = tabBarVC
                
        self.window?.makeKeyAndVisible()
        
        DHLog("Application Launching")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

}
