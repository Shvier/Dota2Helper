//
//  DHNewsDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 9/22/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHNewsDetailViewController: UIViewController {

    var newsModel: DHNewsModel?
    var dataController: DHNewsDetailDataController?
    var newsDetailView: DHNewsDetailView?
    
    func handleData() {
        dataController = DHNewsDetailDataController()
        let request: URLRequest = (dataController?.requestNewsDetailDataUrlWithNewsModel(newsModel: newsModel!))!
        let viewModel: DHNewsDetailViewModel = DHNewsDetailViewModel(request: request)
        newsDetailView = DHNewsDetailView(frame: CGRect(x: 0, y: 0, width: kNewsDetailViewWidth, height: kNewsDetailViewHeight))
        newsDetailView?.bindDataWithViewModel(viewModel: viewModel)
    }
    
    func renderNewsDetailView() {
        view.addSubview(newsDetailView!)
    }
    
    func backToForeVC() {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    func setContentView() {
    }
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        navigationItem.title = "详情"
        let leftBarItem: UIBarButtonItem = UIBarButtonItem(title: "返回", style: .done, target: self, action: #selector(self.backToForeVC))
        leftBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: kThemeColor], for: .normal)
        navigationItem.leftBarButtonItem = leftBarItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        handleData()
        renderNewsDetailView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
