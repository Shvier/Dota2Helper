//
//  DHJournalDetailView.swift
//  Dota2Helper
//
//  Created by Shvier on 9/26/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHJournalDetailView: UIView {
    
    let kJournalDetailViewWidth: CGFloat = UIScreen.main.bounds.size.width
    let kJournalDetailViewHeight: CGFloat = UIScreen.main.bounds.size.height
    let kTitleOffsetX: CGFloat = 50
    let kNavigationHeight: CGFloat = 64
    
    var titleLabel: UILabel?
    var dateLabel: UILabel?
    var descriptionLabel: UILabel?
    
    func bindDataWithViewModel(viewModel: DHJournalDetailViewModel) {
        titleLabel?.text = viewModel.journal?.title
        dateLabel?.text = viewModel.journal?.date
        descriptionLabel?.text = viewModel.journal?.journalDescription
        
        setLayout()
    }
    
    func labelSize(content: String, attributes: [String : AnyObject]) -> CGRect {
        let kTitleMaxWidth: CGFloat = UIScreen.main.bounds.size.width - kTitleOffsetX*2
        var size = CGRect()
        let maxSize = CGSize(width: kTitleMaxWidth, height: 0);
        size = content.boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return size
    }
    
    func setLayout() {
        let kTitleMaxWidth: CGFloat = UIScreen.main.bounds.size.width - kTitleOffsetX*2
        var titleLabelHeight: CGFloat = 0
        var dateLabelheight: CGFloat = 0
        if let content: String = titleLabel?.text {
            let boundingRect = labelSize(content: content, attributes: [NSFontAttributeName: (titleLabel?.font)!])
            titleLabelHeight = boundingRect.height
        } else {
            let content = "Unknown Title"
            let boundingRect = labelSize(content: content, attributes: [NSFontAttributeName: (titleLabel?.font)!])
            titleLabelHeight = boundingRect.height
        }
        if let content: String = dateLabel?.text {
            let boundingRect = labelSize(content: content, attributes: [NSFontAttributeName: (dateLabel?.font)!])
            dateLabelheight = boundingRect.height
        } else {
            let content = "Unknown Time"
            let boundingRect = labelSize(content: content, attributes: [NSFontAttributeName: (dateLabel?.font)!])
            dateLabelheight = boundingRect.height
        }
        titleLabel?.frame = CGRect(x: kTitleOffsetX, y: kNavigationHeight, width: kTitleMaxWidth, height: titleLabelHeight)
        dateLabel?.frame = CGRect(x: kTitleOffsetX, y: kNavigationHeight+(titleLabel?.bounds.size.height)!+10, width: kTitleMaxWidth, height: dateLabelheight)
        descriptionLabel?.frame = CGRect(x: kTitleOffsetX, y: kNavigationHeight+(titleLabel?.bounds.size.height)!+dateLabel!.frame.size.height+10, width: kTitleMaxWidth, height: kJournalDetailViewHeight-dateLabel!.frame.size.height-dateLabelheight)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel = UILabel()
        dateLabel = UILabel()
        descriptionLabel = UILabel()
        
        self.addSubview(titleLabel!)
        self.addSubview(dateLabel!)
        self.addSubview(descriptionLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
