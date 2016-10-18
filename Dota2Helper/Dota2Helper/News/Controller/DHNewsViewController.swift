//
//  DHNewsViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit
import MJRefresh
import SafariServices

class DHNewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate {

    var dataController: DHNewsDataController?
    var headerView: DHHeaderView?
    var tableView: UITableView?
    var loadingView: DHLoadingView?
    
    func handleNewsData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView?.mj_header.endRefreshing()
        }
        dataController = DHNewsDataController()
        weak var weakSelf = self
        dataController?.requestNewsDataWithCallback(callback: {
            let strongSelf = weakSelf
            strongSelf?.renderTableViewCell()
            tableView?.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    strongSelf?.tableView?.mj_footer.endRefreshing()
                }
                self.dataController?.requestMoreNews(callback: {
                    strongSelf?.tableView?.mj_footer.endRefreshing()
                    DispatchQueue.main.async(execute: {
                        strongSelf?.tableView?.reloadData()
                    })
                }())
            })
            strongSelf?.tableView?.mj_header.endRefreshing()
        }())
    }
    
    func renderTableViewCell() {
        headerView = DHHeaderView(frame: CGRect(x: 0, y: 0, width: kBannerWidth, height: kBannerHeight))
        tableView?.tableHeaderView = headerView
        let banners = NSArray(array: (dataController?.bannerDataSource)!)
        let headerViewModel: DHNewsBannerViewModel = DHNewsBannerViewModel(banners: banners as! [DHNewsModel]);
        headerView?.bindDataWithViewModel(viewModel: headerViewModel)
        let array = NSArray(array: (headerView?.banners)!)
        weak var weakSelf = self
        for banner in array as! [DHBanner] {
            banner.callback = ({
                let strongSelf = weakSelf
                strongSelf?.loadToDetailVCWithNewsModel(newsModel: banner.newsModel!)
            })
            if #available(iOS 9.0, *) {
                self.registerForPreviewing(with: self, sourceView: banner)
            } else {
                // Fallback on earlier versions
            }
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
    
    @available(iOS 9.0, *)
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let newsDetailVC: DHNewsDetailViewController = DHNewsDetailViewController()
        if previewingContext.sourceRect.size.height == 80 {
            let cell = previewingContext.sourceView as! DHNewsTableViewCell
            newsDetailVC.newsModel = cell.newsModel
        } else {
            let banner = previewingContext.sourceView as! DHBanner
            newsDetailVC.newsModel = banner.newsModel
        }
        return newsDetailVC
    }
    
    @available(iOS 9.0, *)
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
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
            if #available(iOS 9.0, *) {
                if traitCollection.forceTouchCapability == .available {
                    registerForPreviewing(with: self, sourceView: cell)
                }
            } else {
                // Fallback on earlier versions
            }
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
        tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UINib(nibName: "DHNewsTableViewCell", bundle: nil), forCellReuseIdentifier: kNewsCellReuseIdentifier)
        weak var weakSelf = self
        tableView?.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            let strongSelf = weakSelf
            strongSelf?.handleNewsData()
        })
        view.addSubview(tableView!)
        loadingView = addLoadingViewForViewController(self)
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
