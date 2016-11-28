//
//  DHJournalTableViewCell.swift
//  Dota2Helper
//
//  Created by Shvier on 9/26/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Kingfisher

let kJournalTableViewCellHeight: CGFloat = 90

class DHJournalTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var journalDescriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var journalModel: DHJournalModel?
    
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
    
    func bindDataWithViewModel(viewModel: DHJournalViewModel) {
        self.journalModel = viewModel.journalModel
        if let urlString = viewModel.background {
            backgroundImageView.kf_setImage(with: URL(string: urlString))
        }
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