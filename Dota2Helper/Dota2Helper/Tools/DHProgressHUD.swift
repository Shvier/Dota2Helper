//
//  DHProgressHUD.swift
//  Dota2Helper
//
//  Created by Shvier on 04/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

let kDelayTime: TimeInterval = 2.0

class DHProgressHUD: NSObject {
    
    class func showMessage(message: String, view: UIView){
        let hud: MBProgressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = MBProgressHUDMode.customView
        hud.tintColor = UIColor.white
        hud.label.text = message
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: kDelayTime)
    }
    
}
