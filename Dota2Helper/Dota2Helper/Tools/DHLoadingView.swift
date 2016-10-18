//
//  DHLoadingView.swift
//  Dota2Helper
//
//  Created by Shvier on 08/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHLoadingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        let hint: String = "正在加载"
        let hintLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: hint.sizeOfContent(font: UIFont(name: "Helvetica", size: 20)!).width, height: 18))
        hintLabel.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        hintLabel.text = hint
        hintLabel.textAlignment = .center
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        indicator.center = CGPoint(x: frame.size.width/2 - hintLabel.frame.size.width/2 - indicator.frame.size.width/2, y: frame.size.height/2)
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        self.addSubview(indicator)
        self.addSubview(hintLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
