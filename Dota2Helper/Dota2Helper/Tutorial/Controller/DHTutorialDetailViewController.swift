//
//  DHTutorialDetailViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHTutorialDetailViewController: DHBaseViewController {

    var tutorialModel: DHTutorialModel?
    var dataController: DHTutorialDetailDataController?
    var tutorialDetailView: DHNewsDetailView?
    
    func handleData() {
        dataController = DHTutorialDetailDataController()
        let request: URLRequest = (dataController?.requestTutorialDetailDataUrlWithTutorialModel(tutorialModel: tutorialModel!))!
        let viewModel: DHNewsDetailViewModel = DHNewsDetailViewModel(request: request)
        tutorialDetailView = DHNewsDetailView(frame: CGRect(x: 0, y: 20, width: kNewsDetailViewWidth, height: kNewsDetailViewHeight))
        tutorialDetailView?.bindDataWithViewModel(viewModel: viewModel)
    }
    
    func renderNewsDetailView() {
        view.addSubview(tutorialDetailView!)
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
