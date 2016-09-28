//
//  DHJournalDetailView.swift
//  Dota2Helper
//
//  Created by Shvier on 9/26/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHJournalDetailView: UIView {
    
    var titleLabel: UILabel?
    var dateLabel: UILabel?
    var descriptionLabel: UILabel?
    
    func bindDataWithViewModel(viewModel: DHJournalDetailViewModel) {
        titleLabel?.text = viewModel.journal?.title
        dateLabel?.text = viewModel.journal?.date
        descriptionLabel?.text = viewModel.journal?.journalDescription
    }
    
    func setLayout() {
        var titleLabelHeight: CGFloat = 0
        var dateLabelheight: CGFloat = 0
        let options: NSStringDrawingOptions = .usesLineFragmentOrigin
        if let content: String = titleLabel?.text {
            let boundingRect = content.boundingRect(with: CGSize(width: 200, height: 0), options: options, attributes: [NSFontAttributeName: titleLabel?.font], context: nil)
            titleLabelHeight = boundingRect.height
        } else {
            let content = "Unknown Title"
            let boundingRect = content.boundingRect(with: CGSize(width: 200, height: 0), options: options, attributes: [NSFontAttributeName: titleLabel?.font], context: nil)
            titleLabelHeight = boundingRect.height
        }
        if let content: String = dateLabel?.text {
            let boundingRect = content.boundingRect(with: CGSize(width: 200, height: 0), options: options, attributes: [NSFontAttributeName: dateLabel?.font], context: nil)
            dateLabelheight = boundingRect.height
        } else {
            let content = "Unknown Time"
            let boundingRect = content.boundingRect(with: CGSize(width: 200, height: 0), options: options, attributes: [NSFontAttributeName: dateLabel?.font], context: nil)
            dateLabelheight = boundingRect.height
        }
        titleLabel?.frame = CGRect(x: 0, y: 0, width: kJournalDetailViewWidth, height: titleLabelHeight)
        dateLabel?.frame = CGRect(x: 0, y: titleLabelHeight+10, width: kJournalDetailViewWidth, height: dateLabelheight)
        descriptionLabel?.frame = CGRect(x: 0, y: dateLabel!.frame.size.height+dateLabelheight, width: kJournalDetailViewWidth, height: kJournalDetailViewHeight-dateLabel!.frame.size.height-dateLabelheight)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel = UILabel()
        dateLabel = UILabel()
        descriptionLabel = UILabel()
        
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
