//
//  DHVideoTableViewCell.swift
//  Dota2Helper
//
//  Created by Shvier on 10/5/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Kingfisher

class DHVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var videoLengthLabel: UILabel!
    @IBOutlet weak var pulishinLabel: UILabel!
    
    func bindDataWithViewModel(viewModel: DHVideoCellViewModel) {
        if let urlString = viewModel.background {
            backgroundImageView.kf_setImage(with: URL(string: urlString))
        }
        titleLabel.text = viewModel.title
        videoLengthLabel.text = viewModel.videolength
        pulishinLabel.text = viewModel.pulishin
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
