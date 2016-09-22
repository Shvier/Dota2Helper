//
//  DHNewsTableViewCell.swift
//  Dota2Helper
//
//  Created by Shvier on 9/19/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Kingfisher

let kNewsTableViewCellHeight: CGFloat = 80

class DHNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var viewModel: DHNewsCellViewModel?
    
    func bindDataWithViewModel(_ viewModel: DHNewsCellViewModel) {
        self.viewModel = viewModel
        let url = URL(string: (self.viewModel?.background!)!)
        backgroundImageView.kf_setImage(with: url)
        titleLabel.text = self.viewModel?.title
        newsDescriptionLabel.text = self.viewModel?.newsDescription
        timeLabel.text = self.viewModel?.time
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
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
