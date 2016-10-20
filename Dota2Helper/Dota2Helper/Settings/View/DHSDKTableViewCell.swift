//
//  DHSDKTableViewCell.swift
//  Dota2Helper
//
//  Created by Shvier on 10/20/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHSDKTableViewCell: UITableViewCell {

    @IBOutlet weak var sdkNameLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
