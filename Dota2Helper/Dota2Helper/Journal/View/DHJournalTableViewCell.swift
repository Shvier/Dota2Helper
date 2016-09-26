//
//  DHJournalTableViewCell.swift
//  Dota2Helper
//
//  Created by Shvier on 9/26/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Kingfisher

class DHJournalTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var journalDescriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var journalModel: DHJournalModel?
    
    func bindDateWithViewModel(viewModel: DHJournalViewModel) {
        self.journalModel = viewModel.journalModel
        let url = URL(string: (viewModel.background)!)
        backgroundImageView.kf_setImage(with: url)
        titleLabel.text = viewModel.title
        journalDescriptionLabel.text = viewModel.journalDescription
        timeLabel.text = viewModel.time
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
