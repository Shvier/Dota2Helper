//
//  DHVideoTableViewCell.swift
//  Dota2Helper
//
//  Created by Shvier on 10/5/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import Kingfisher

let kVideoTableViewCellHeight: CGFloat = 90

class DHVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var videoLengthLabel: UILabel!
    @IBOutlet weak var publishinLabel: UILabel!
    
    var ykvid: String?
    var videoModel: DHVideoModel?
    
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
    
    func bindDataWithModel(model: DHVideoModel) {
        self.videoModel = model
        if let urlString = model.background {
            backgroundImageView.kf_setImage(with: URL(string: urlString))
        }
        titleLabel.text = model.title
        videoLengthLabel.text = model.videolength
        publishinLabel.text = model.publishin
        ykvid = model.ykvid
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
