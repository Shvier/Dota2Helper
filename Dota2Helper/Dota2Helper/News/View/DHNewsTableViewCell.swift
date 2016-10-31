//
//  DHNewsTableViewCell.swift
//  Dota2Helper
//
//  Created by Shvier on 9/19/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Kingfisher

let kNewsTableViewCellHeight: CGFloat = 110

class DHNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var newsModel: DHNewsModel?
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            let inset: CGFloat = 15
            var frame = newFrame
            frame.origin.x += inset
            frame.origin.y += inset
            frame.size.width -= 2 * inset
            frame.size.height -= 2 * inset
            super.frame = frame
        }
    }
    
    func bindDataWithViewModel(viewModel: DHNewsCellViewModel) {
        self.newsModel = viewModel.newsModel!
        if let urlString = viewModel.background {
            backgroundImageView.kf_setImage(with: URL(string: urlString))
        }
        titleLabel.text = viewModel.title
        newsDescriptionLabel.text = viewModel.newsDescription
        timeLabel.text = viewModel.time
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8.0
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
