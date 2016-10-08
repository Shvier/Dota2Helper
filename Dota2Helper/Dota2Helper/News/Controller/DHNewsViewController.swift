//
//  DHNewsViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit
import MJRefresh

class DHNewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataController: DHNewsDataController?
    var headerView: DHHeaderView?
    var tableView: UITableView?
    var loadingView: DHLoadingView?
    
    func handleNewsData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView?.mj_header.endRefreshing()
        }
        dataController = DHNewsDataController()
        dataController?.requestNewsDataWithCallback(callback: {
            self.renderTableViewCell()
            tableView?.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.tableView?.mj_footer.endRefreshing()
                }
                self.dataController?.requestMoreNews(callback: {
                    self.tableView?.mj_footer.endRefreshing()
                    DispatchQueue.main.async(execute: {
                        self.tableView?.reloadData()
                    })
                }())
            })
            self.tableView?.mj_header.endRefreshing()
        }())
    }
    
    func renderTableViewCell() {
        headerView = DHHeaderView(frame: CGRect(x: 0, y: 0, width: kBannerWidth, height: kBannerHeight))
        tableView?.tableHeaderView = headerView
        let banners = NSArray(array: (dataController?.bannerDataSource)!)
        let headerViewModel: DHNewsBannerViewModel = DHNewsBannerViewModel(banners: banners as! [DHNewsModel]);
        headerView?.bindDataWithViewModel(viewModel: headerViewModel)
        let array = NSArray(array: (headerView?.banners)!)
        for banner in array as! [DHBanner] {
            banner.callback = ({
                self.loadToDetailVCWithNewsModel(newsModel: banner.newsModel!)
            })
        }
        DispatchQueue.main.async(execute: {
            self.loadingView?.isHidden = true
            self.tableView?.reloadData()
        })
    }
    
    func loadToDetailVCWithNewsModel(newsModel: DHNewsModel) {
        let newsDetailVC: DHNewsDetailViewController = DHNewsDetailViewController()
        newsDetailVC.newsModel = newsModel;
        navigationController?.pushViewController(newsDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataController?.newsDataSource?.count)! > 0 ? (dataController?.newsDataSource?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kNewsTableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DHNewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: kNewsCellReuseIdentifier, for: indexPath) as! DHNewsTableViewCell
        if (dataController?.newsDataSource?.count)! > 0 {
            let newsModel = dataController?.newsDataSource?[indexPath.row] as! DHNewsModel
            let cellViewModel: DHNewsCellViewModel = DHNewsCellViewModel.init(newsModel: newsModel)
            cell.bindDataWithViewModel(viewModel: cellViewModel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell: DHNewsTableViewCell = tableView.cellForRow(at: indexPath) as! DHNewsTableViewCell
        loadToDetailVCWithNewsModel(newsModel: cell.newsModel!)
    }
    
    func refreshStateChange(control: UIRefreshControl) {
        control.endRefreshing()
    }
    
    func setContentView() {
        tableView = UITableView.init(frame: view.bounds, style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UINib(nibName: "DHNewsTableViewCell", bundle: nil), forCellReuseIdentifier: kNewsCellReuseIdentifier)
        tableView?.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.handleNewsData()
        })
        view.addSubview(tableView!)
        loadingView = DHLoadingView(frame: view.bounds)
        view.addSubview(loadingView!)
    }
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        navigationItem.title = "掌刀"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        setContentView()
        handleNewsData()
    }
    
}
