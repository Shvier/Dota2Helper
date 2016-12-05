//
//  DHToastMessage.swift
//  Dota2Helper
//
//  Created by Shvier on 10/14/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

let ToastShow = { (message: String) in
    let toastView = DHToastMessage.showMessage(message: message)
}

class DHToastMessage: UIView {

    class func showMessage(message: String) -> DHToastMessage {
        let toastView = DHToastMessage(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        toastView.center = CGPoint(x: kScreenWidth/2, y: kScreenWidth - 60)
        toastView.backgroundColor = UIColor.orange
        toastView.alpha = 0
        UIApplication.shared.keyWindow?.addSubview(toastView)
        UIView.animate(withDuration: 0.6) {
            toastView.alpha = 0.5
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 0.6, animations: {
                toastView.alpha = 0
            })
        }
        return toastView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
