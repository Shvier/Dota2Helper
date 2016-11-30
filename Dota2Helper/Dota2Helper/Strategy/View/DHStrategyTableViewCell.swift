//
//  DHStrategyTableViewCell.swift
//  Dota2Helper
//
//  Created by Shvier on 9/30/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Kingfisher

let kStrategyTableViewCellHeight: CGFloat = 90

class DHStrategyTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var strategyModel: DHStrategyModel?
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            let inset: CGFloat = 5
            var frame = newFrame
            frame.origin.x += 2 * inset
            frame.origin.y += inset
            frame.size.width -= 4 * inset
            frame.size.height -= 2 * inset
            super.frame = frame
        }
    }
    
    func bindDataWithModel(model: DHStrategyModel) {
        self.strategyModel = model
        if let urlString = model.background {
            backgroundImageView.kf_setImage(with: URL(string: urlString))
        }
        titleLabel.text = model.title
        descriptionLabel.text = model.strategyDescription
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
