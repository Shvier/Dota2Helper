//
//  DHTutorialTableViewCell.swift
//  Dota2Helper
//
//  Created by Shvier on 9/30/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Kingfisher

let kTutorialTableViewCellHeight: CGFloat = 80

class DHTutorialTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroudImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func bindDataWithViewModel(viewModel: DHTutorialCellViewModel) {
        if let urlString = viewModel.background {
            backgroudImageView.kf_setImage(with: URL(string: urlString))
        }
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.tutorialDescription
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
