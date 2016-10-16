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
        dataController = DHJournalDetailDataController()
        let request: URLRequest = (dataController?.requestJournalDetailDataWithJournalModel(journalModel: journalModel!))!
        let viewModel: DHNewsDetailViewModel = DHNewsDetailViewModel(request: request)
        journalDetailView = DHJournalDetailView(frame: CGRect(x: 0, y: 20, width: kNewsDetailViewWidth, height: kNewsDetailViewHeight))
        journalDetailView?.bindDataWithViewModel(viewModel: viewModel)
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
