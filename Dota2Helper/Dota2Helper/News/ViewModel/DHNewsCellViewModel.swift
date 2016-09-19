//
//  DHNewsCellViewModel.swift
//  Dota2Helper
//
//  Created by Shvier on 9/19/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHNewsCellViewModel: NSObject {

    var newsCell: DHNewsTableViewCell?
    
    init(_ newsModel: DHNewsModel?) {
        super.init()
        newsCell = DHNewsTableViewCell()
    }
    
    func viewModel(_ newsModel: DHNewsModel?) -> DHNewsCellViewModel {
        return DHNewsCellViewModel.init(newsModel)
    }
    
}
