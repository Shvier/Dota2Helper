//
//  DHNewsDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/22/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHNewsDetailViewController: UIViewController {

    var newsCell: DHNewsTableViewCell?
    var dataController: DHNewsDetailDataController?
    var newsDetailView: DHNewsDetailView?
    
    func handleData() {
        dataController = DHNewsDetailDataController()
        let request: URLRequest = (dataController?.requestNewsDetailDataUrlWithNewsCell(newsCell: newsCell!))!
        let viewModel: DHNewsDetailViewModel = DHNewsDetailViewModel(request: request)
        newsDetailView = DHNewsDetailView(frame: CGRect(x: 0, y: 0, width: kNewsDetailViewWidth, height: kNewsDetailViewHeight))
        newsDetailView?.bindDataWithViewModel(viewModel: viewModel)
        renderNewsDetailView()
    }
    
    func renderNewsDetailView() {
        view.addSubview(newsDetailView!)
    }
    
    func setContentView() {
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
