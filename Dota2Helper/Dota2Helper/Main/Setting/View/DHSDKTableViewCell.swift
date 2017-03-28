//
//  DHSDKTableViewCell.swift
//  Dota2Helper
//
//  Created by Shvier on 10/20/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHSDKTableViewCell: DHBaseTableViewCell {

    let kSDKNameLabelFontSize: CGFloat = 15
    let kSDKNameLabelOffsetTop: CGFloat = 5
    let kSDKNameLabelOffsetLeft: CGFloat = 12
    let kAuthorNameLabelFontSize: CGFloat = 12
    let kAuthorNameLabelOffsetTop: CGFloat = 5
    
    var sdkNameLabel: UILabel!
    var authorNameLabel: UILabel!
    
// MARK: - Life Cycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
        self.makeConstraints()
    }
    
    func initUI() {
        self.accessoryType = .disclosureIndicator
        
        sdkNameLabel = ({
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: kSDKNameLabelFontSize)
            label.textAlignment = .left
            label.preferredMaxLayoutWidth = kScreenWidth
            label.text = "(null)"
            return label
        }())
        contentView.addSubview(sdkNameLabel)
        
        authorNameLabel = ({
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: kAuthorNameLabelFontSize)
            label.textAlignment = .left
            label.preferredMaxLayoutWidth = kScreenWidth
            label.textColor = .gray
            label.text = "(null)"
            return label
        }())
        contentView.addSubview(authorNameLabel)
    }
    
    func makeConstraints() {
        sdkNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(kSDKNameLabelOffsetLeft)
            make.top.equalTo(contentView).offset(kSDKNameLabelOffsetTop)
        }
        
        authorNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(sdkNameLabel)
            make.top.equalTo(sdkNameLabel.snp.lastBaseline).offset(kAuthorNameLabelOffsetTop)
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
