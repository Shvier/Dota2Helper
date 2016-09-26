//
//  DHJournalDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/26/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHJournalDetailViewController: UIViewController {

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
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationItem.title = "详情"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initLifeCycle()
        handleData()
        renderJournalDetailView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
