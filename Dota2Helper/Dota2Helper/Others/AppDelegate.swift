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
    var tabbarVC: UITabBarController?
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        switch shortcutItem.type {
            case "OpenNews":
                tabbarVC?.selectedViewController = tabbarVC?.viewControllers?[0]
            break
            case "OpenVideo":
                tabbarVC?.selectedViewController = tabbarVC?.viewControllers?[1]
            break
            case "OpenTutorial":
                tabbarVC?.selectedViewController = tabbarVC?.viewControllers?[2]
            break
            case "OpenUpdate":
                tabbarVC?.selectedViewController = tabbarVC?.viewControllers?[3]
            break
            default:
            break
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        tabbarVC = UITabBarController()
        let newsVC: DHNewsViewController = DHNewsViewController()
        let newsNaVC: UINavigationController = UINavigationController(rootViewController: newsVC)
        newsVC.tabBarItem = UITabBarItem(title: "资讯", image: UIImage(named: "tabbar_icon_news")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabbar_icon_news_h")?.withRenderingMode(.alwaysOriginal))
        
        let videoVC: DHVideoViewController = DHVideoViewController()
        let videoNaVC: UINavigationController = UINavigationController(rootViewController: videoVC)
        videoVC.tabBarItem = UITabBarItem(title: "视频", image: UIImage(named: "tabbar_icon_video")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabbar_icon_video_h")?.withRenderingMode(.alwaysOriginal))
        
        let tutorialVC: DHTutorialViewController = DHTutorialViewController()
        let tutorialNaVC: UINavigationController = UINavigationController(rootViewController: tutorialVC)
        tutorialVC.tabBarItem = UITabBarItem(title: "攻略", image: UIImage(named: "tabbar_icon_tutorial")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabbar_icon_tutorial_h")?.withRenderingMode(.alwaysOriginal))
        
        let updatesVC: DHUpdatesViewController = DHUpdatesViewController()
        let updatesNaVC: UINavigationController = UINavigationController(rootViewController: updatesVC)
        updatesVC.tabBarItem = UITabBarItem(title: "更新", image: UIImage(named: "tabbar_icon_update")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabbar_icon_update_h")?.withRenderingMode(.alwaysOriginal))
        
        let settingsVC: DHSettingsViewController = DHSettingsViewController()
        let settingsNaVC: UINavigationController = UINavigationController(rootViewController: settingsVC)
        settingsNaVC.tabBarItem = UITabBarItem(title: "其它", image: UIImage(named: "tabbar_icon_settings")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabbar_icon_settings_h")?.withRenderingMode(.alwaysOriginal))
        
        tabbarVC?.viewControllers = [newsNaVC, videoNaVC, tutorialNaVC, updatesNaVC, settingsNaVC]
        
        tabbarVC?.tabBar.isTranslucent = false
        tabbarVC?.tabBar.barStyle = .black
        tabbarVC?.tabBar.tintColor = kTabBarItemColor
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: kThemeColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red:0.80, green:0.00, blue:0.00, alpha:1.00)], for: .selected)
        
        self.window?.rootViewController = tabbarVC
        
        self.window?.makeKeyAndVisible()
        application.setStatusBarHidden(false, with: .fade)
        let launchImage: UIImageView = UIImageView(frame: (window?.bounds)!)
        launchImage.image = UIImage(named: "launch_image")
        window?.addSubview(launchImage)
        UIView.animate(withDuration: 1) {
            launchImage.alpha = 0.5
            UIView.animate(withDuration: 0.7, animations: {
                launchImage.bounds = CGRect(x: 0, y: 0, width: 1.5*launchImage.bounds.size.width, height: 1.5*launchImage.bounds.size.height)
                launchImage.alpha = 0
            })
        }
        
        DHLog("Application Launching")
        
        Bugtags.start(withAppKey: "2dd6496749c90f7cd480df72d142f918", invocationEvent: BTGInvocationEventNone)
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
