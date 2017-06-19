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

class DHStrategyTableViewCell: DHBaseTableViewCell {
    
    let kContentViewCornerRadius: CGFloat = 5
    let kTitleLabelFontSize: CGFloat = 15
    let kDescriptionLabelFontSize: CGFloat = 12
    
    let kBackgroundImageViewMargin: CGFloat = 5
    let kBackgroundImageViewRatio: CGFloat = 16/10
    let kTitleLabelMargin: CGFloat = 5
    let kDescriptionLabelMargin: CGFloat = 5

    var backgroundImageView: UIImageView!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    
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
            backgroundImageView.kf.setImage(with: URL(string: urlString))
        }
        titleLabel.text = model.title
        descriptionLabel.text = model.strategyDescription
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
            label.preferredMaxLayoutWidth = kScreenWidth
            label.text = "(null)"
            return label
        }())
        contentView.addSubview(titleLabel)
        
        descriptionLabel = ({
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: kDescriptionLabelFontSize)
            label.textAlignment = .left
            label.preferredMaxLayoutWidth = kScreenWidth
            label.numberOfLines = 3
            label.lineBreakMode = .byWordWrapping
            label.text = "(null)"
            return label
        }())
        contentView.addSubview(descriptionLabel)
    }
    
    func makeConstraints() {
        backgroundImageView.snp.makeConstraints { (make) in
            make.left.top.equalTo(contentView).offset(kBackgroundImageViewMargin)
            make.bottom.equalTo(contentView).offset(-kBackgroundImageViewMargin)
            make.width.equalTo(backgroundImageView.snp.height).multipliedBy(kBackgroundImageViewRatio)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(backgroundImageView.snp.right).offset(kTitleLabelMargin)
            make.top.equalTo(contentView).offset(kTitleLabelMargin)
            make.right.equalTo(contentView).offset(-kTitleLabelMargin)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(kDescriptionLabelMargin)
            make.bottom.equalTo(contentView).offset(-kDescriptionLabelMargin)
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
