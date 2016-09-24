//
//  DHFooterView.swift
//  Dota2Helper
//
//  Created by Shvier on 9/24/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHFooterView: UIView {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var loadHintLabel: UILabel!
    
    @IBAction func loadMore(_ sender: AnyObject) {
        self.indicator.isHidden = false
        let dealineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: dealineTime) { 
            self.indicator.isHidden = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
