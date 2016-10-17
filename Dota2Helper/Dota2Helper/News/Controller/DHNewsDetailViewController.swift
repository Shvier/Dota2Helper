//
//  DHNewsDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/22/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHNewsDetailViewController: DHBaseDetailViewController {

    var newsModel: DHNewsModel?
    var dataController: DHNewsDetailDataController?
    var newsDetailView: DHNewsDetailView?
    
    func handleData() {
        dataController = DHNewsDetailDataController()
        let request: URLRequest = (dataController?.requestNewsDetailDataUrlWithNewsModel(newsModel: newsModel!))!
        let viewModel: DHNewsDetailViewModel = DHNewsDetailViewModel(request: request)
        newsDetailView = DHNewsDetailView(frame: CGRect(x: 0, y: 20, width: kNewsDetailViewWidth, height: kNewsDetailViewHeight))
        newsDetailView?.bindDataWithViewModel(viewModel: viewModel)
    }
    
    func renderNewsDetailView() {
        view.addSubview(newsDetailView!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleData()
        renderNewsDetailView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
