//
//  AppDelegate.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        let tabBarVC: UITabBarController = UITabBarController()
        let newsVC: DHNewsViewController = DHNewsViewController()
        let newsNaVC: UINavigationController = UINavigationController(rootViewController: newsVC)
        newsVC.tabBarItem = UITabBarItem(title: "资讯", image: UIImage(named: "tabbar_icon_news")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabbar_icon_news_h")?.withRenderingMode(.alwaysOriginal))
        
        let videoVC: DHVideoViewController = DHVideoViewController()
        let videoNaVC: UINavigationController = UINavigationController(rootViewController: videoVC)
        videoVC.tabBarItem = UITabBarItem(title: "视频", image: UIImage(named: "tabbar_icon_video")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabbar_icon_video_h")?.withRenderingMode(.alwaysOriginal))
        
        let tutorialVC: DHTutorialViewController = DHTutorialViewController()
        let tutorialNaVC: UINavigationController = UINavigationController(rootViewController: tutorialVC)
        tutorialVC.tabBarItem = UITabBarItem(title: "攻略", image: UIImage(named: "tabbar_icon_tutorial")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabbar_icon_tutorial_h")?.withRenderingMode(.alwaysOriginal))
        
        let journalVC: DHJournalViewController = DHJournalViewController()
        let journalNaVC: UINavigationController = UINavigationController(rootViewController: journalVC)
        journalVC.tabBarItem = UITabBarItem(title: "更新", image: UIImage(named: "tabbar_icon_journal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabbar_icon_journal_h")?.withRenderingMode(.alwaysOriginal))
        
        let settingsVC: DHSettingsViewController = DHSettingsViewController()
        let settingsNaVC: UINavigationController = UINavigationController(rootViewController: settingsVC)
        settingsNaVC.tabBarItem = UITabBarItem(title: "其它", image: UIImage(named: "tabbar_icon_settings")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabbar_icon_settings_h")?.withRenderingMode(.alwaysOriginal))
        
        tabBarVC.viewControllers = [newsNaVC, videoNaVC, tutorialNaVC, journalNaVC, settingsNaVC]
        
        tabBarVC.tabBar.tintColor = UIColor.red
        tabBarVC.tabBar.isTranslucent = false
        tabBarVC.tabBar.barStyle = .black
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: kThemeColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red:0.80, green:0.00, blue:0.00, alpha:1.00)], for: .selected)
        
        self.window?.rootViewController = tabBarVC
                
        self.window?.makeKeyAndVisible()
        
        application.setStatusBarHidden(false, with: .fade)
        
        DHLog("Application Launching")
        
        Fabric.with([Crashlytics.self])
        
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
