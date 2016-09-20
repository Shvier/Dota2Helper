//
//  DHNewsViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit

class DHNewsViewController: UITableViewController {

    var dataController: DHNewsDataController?
    var bannerView: DHBannerView?
    
    func handleNewsData() {
        dataController = DHNewsDataController()
        dataController?.requestNewsDataWithCallback(callback: {
            self.renderTableViewCell()
        }())
    }
    
    func renderTableViewCell() {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataController?.newsDataSource?.count)! > 0 ? (dataController?.newsDataSource?.count)! : 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        bannerView = DHBannerView()
        if (dataController?.bannerDataSource?.count)! > 0 {
            let headerViewModel: DHNewsBannerViewModel = DHNewsBannerViewModel();
            bannerView?.bindDataWithViewModel(headerViewModel)
        }
        return bannerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DHNewsTableViewCell  = tableView.dequeueReusableCell(withIdentifier: kNewsCellReuseIdentifier, for: indexPath) as! DHNewsTableViewCell
        if (dataController?.newsDataSource?.count)! > 0 {
            let newsModel = dataController?.newsDataSource?[indexPath.row] as! DHNewsModel
            let cellViewModel: DHNewsCellViewModel = DHNewsCellViewModel.init(newsModel)
            cell.bindDataWithViewModel(cellViewModel)
        }
        return cell
    }
    
    func setContentView() {
        tableView.register(UINib(nibName: "DHNewsTableViewCell", bundle: nil), forCellReuseIdentifier: kNewsCellReuseIdentifier)
    }
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationItem.title = "掌刀"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        setContentView()
        handleNewsData()
    }
    
}
