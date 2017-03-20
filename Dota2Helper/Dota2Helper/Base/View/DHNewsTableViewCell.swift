//
//  DHNewsTableViewCell.swift
//  Dota2Helper
//
//  Created by Shvier on 9/19/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

let kNewsTableViewCellHeight: CGFloat = 90
let kContentViewCornerRadius: CGFloat = 5
let kTitleLabelFontSize: CGFloat = 15
let kDescriptionLabelFontSize: CGFloat = 12
let kTimeLabelFontSize: CGFloat = 12

let kBackgroundImageViewMargin: CGFloat = 5
let kBackgroundImageViewRatio: CGFloat = 16/10
let kTitleLabelMargin: CGFloat = 5
let kDescriptionLabelMargin: CGFloat = 5
let kTimeLabelMargin: CGFloat = 5

class DHNewsTableViewCell: DHBaseTableViewCell {

    var backgroundImageView: UIImageView!
    var titleLabel: UILabel!
    var newsDescriptionLabel: UILabel!
    var timeLabel: UILabel!
    
    var newsModel: DHNewsModel?
    
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
    
    func bindDataWithModel(model: DHNewsModel) {
        self.newsModel = model
        if let urlString = model.background {
            backgroundImageView.kf_setImage(with: URL(string: urlString))
        }
        titleLabel.text = model.title
        newsDescriptionLabel.text = model.newsDescription
        timeLabel.text = model.time
    }
    
// MARK: - Construction Method
    class func cell(tableView: UITableView, indexPath: IndexPath) -> DHNewsTableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: kNewsCellReuseIdentifier, for: indexPath) as! DHNewsTableViewCell
    }
    
// MARK: - Life Cycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
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
        
        newsDescriptionLabel = ({
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: kDescriptionLabelFontSize)
            label.textAlignment = .left
            label.numberOfLines = 2
            label.lineBreakMode = .byWordWrapping
            label.preferredMaxLayoutWidth = kScreenWidth
            label.text = "(null)"
            return label
        }())
        contentView.addSubview(newsDescriptionLabel)
        
        timeLabel = ({
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: kTimeLabelFontSize)
            label.textAlignment = .right
            label.preferredMaxLayoutWidth = kScreenWidth
            label.text = "(null)"
            return label
        }())
        contentView.addSubview(timeLabel)
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
        
        newsDescriptionLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(kDescriptionLabelMargin)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(titleLabel)
            make.top.equalTo(newsDescriptionLabel.snp.bottom).offset(kTimeLabelMargin)
            make.bottom.equalTo(contentView.snp.bottom).offset(-kTimeLabelMargin)
        }
        
        self.layer.cornerRadius = kContentViewCornerRadius
        self.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
