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
    
    let kContentViewCornerRadius: CGFloat = 5
    let kTitleLabelFontSize: CGFloat = 15
    let kVideoLengthLabelFontSize: CGFloat = 12
    let kPublishinLabelFontSize: CGFloat = 12
    
    let kBackgroundImageViewMargin: CGFloat = 5
    let kBackgroundImageViewRatio: CGFloat = 16/10
    let kTitleLabelMargin: CGFloat = 5
    let kVideoLengthLabelMargin: CGFloat = 5

    var backgroundImageView: UIImageView!
    var titleLabel: UILabel!
    var videoLengthLabel: UILabel!
    var publishinLabel: UILabel!
    
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
            backgroundImageView.kf.setImage(with: URL(string: urlString))
        }
        titleLabel.text = model.title
        videoLengthLabel.text = "时长: " + model.videolength!
        publishinLabel.text = model.publishin
        ykvid = model.ykvid
    }

// MARK: - Life Cycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
        self.makeConstraints()
    }
    
    func initUI() {
        backgroundImageView = ({
            let imageView = UIImageView()
            imageView.image = UIImage(named: "placeholder")
            return imageView
        }())
        contentView.addSubview(backgroundImageView)
        
        titleLabel = ({
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: kTitleLabelFontSize)
            label.textAlignment = .left
            label.numberOfLines = 2
            label.lineBreakMode = .byWordWrapping
            label.preferredMaxLayoutWidth = kScreenWidth
            label.text = "(null)"
            return label
        }())
        contentView.addSubview(titleLabel)
        
        videoLengthLabel = ({
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: kVideoLengthLabelFontSize)
            label.textAlignment = .left
            label.preferredMaxLayoutWidth = kScreenWidth
            label.text = "时长: --:--"
            return label
        }())
        contentView.addSubview(videoLengthLabel)
        
        publishinLabel = ({
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: kPublishinLabelFontSize)
            label.textAlignment = .right
            label.preferredMaxLayoutWidth = kScreenWidth
            label.text = "(null)"
            return label
        }())
        contentView.addSubview(publishinLabel)
    }
    
    func makeConstraints() {
        backgroundImageView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(kBackgroundImageViewMargin)
            make.top.equalTo(contentView).offset(kBackgroundImageViewMargin)
            make.bottom.equalTo(contentView).offset(-kBackgroundImageViewMargin)
            make.width.equalTo(backgroundImageView.snp.height).multipliedBy(kBackgroundImageViewRatio)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(backgroundImageView.snp.right).offset(kTitleLabelMargin)
            make.top.equalTo(contentView).offset(kTitleLabelMargin)
            make.right.equalTo(contentView).offset(-kTitleLabelMargin)
        }
        
        videoLengthLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.bottom.equalTo(contentView).offset(-kVideoLengthLabelMargin)
        }
        
        publishinLabel.snp.makeConstraints { (make) in
            make.right.equalTo(titleLabel)
            make.bottom.equalTo(videoLengthLabel)
        }
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
