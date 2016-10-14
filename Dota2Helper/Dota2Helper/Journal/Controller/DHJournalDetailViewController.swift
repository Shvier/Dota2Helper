//
//  DHJournalDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/26/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHJournalDetailViewController: DHBaseViewController {

    var journalModel: DHJournalModel?
    var dataController: DHJournalDetailDataController?
    var journalDetailView: DHJournalDetailView?
    
    func handleData() {
        let journalViewModel: DHJournalDetailViewModel = DHJournalDetailViewModel(journalModel: journalModel!)
        journalDetailView = DHJournalDetailView(frame: view.bounds)
        journalDetailView?.bindDataWithViewModel(viewModel: journalViewModel)
    }
    
    func renderJournalDetailView() {
        view.addSubview(journalDetailView!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handleData()
        renderJournalDetailView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
