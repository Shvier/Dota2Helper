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
        let titleHeight = 
        titleLabel?.frame = CGRect(x: 0, y: 0, width: kJournalDetailViewWidth, height: <#T##CGFloat#>)
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
