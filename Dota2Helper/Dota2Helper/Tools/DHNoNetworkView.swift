//
//  DHNoNetworkView.swift
//  Dota2Helper
//
//  Created by Shvier on 10/19/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

let addNoNetworkViewForViewController = { (viewController: UIViewController) -> DHNoNetworkView in
    let noNetworkView = DHNoNetworkView(frame: viewController.view.bounds)
    viewController.view.addSubview(noNetworkView)
    return noNetworkView
}

class DHNoNetworkView: UIView {

    var hintImage: UIImageView?
    var hintLabel: UILabel?
    
    func bindDataWithHintData(hint: HintData) {
        hintImage?.image = UIImage(named: hint.imageName)
        hintLabel?.text = hint.hintContent
    }
    
    func setLayout() {
        hintImage?.frame = CGRect(x: 0, y: 0, width: 170, height: 170)
        hintLabel?.frame = CGRect(x: 0, y: 0, width: (hintLabel?.text?.sizeOfContent(font: UIFont(name: "Helvetica", size: 20)!).width)!, height: 18)
        hintImage?.center = CGPoint(x: kScreenWidth/2, y: kScreenHeight/2 - (hintImage?.frame.size.height)!/2)
        hintLabel?.center = CGPoint(x: kScreenWidth/2, y: kScreenHeight/2)
    }
    
    func show() {
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        hintImage = UIImageView()
        hintLabel = UILabel(frame: CGRect.zero)
        
        let hint: HintData = DHHintManager.sharedInstance.getHint()
        bindDataWithHintData(hint: hint)
        setLayout()
        hintLabel?.textColor = kThemeColor
        hintLabel?.textAlignment = .center
        self.backgroundColor = UIColor.white
        self.addSubview(hintImage!)
        self.addSubview(hintLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
