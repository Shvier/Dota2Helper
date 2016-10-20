//
//  DHNewsViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit
import MJRefresh
import ReachabilitySwift
import SDCycleScrollView

class DHNewsViewController: DHBaseViewController {

    lazy var dataController: DHNewsDataController = {
        return DHNewsDataController()
    }()
    lazy var headerView: SDCycleScrollView = {
        return SDCycleScrollView(frame: CGRect(x: 0, y: 0, width: kBannerWidth, height: kBannerHeight), delegate: self, placeholderImage: UIImage(named: "placeholder.jpg"))
    }()
    var tableView: UITableView?
    var loadingView: DHLoadingView?
    var noNetworkView: DHNoNetworkView?
    var headerViewModel: DHNewsBannerViewModel?
    
// MARK: - Data Handler and View Renderer
    func handleNewsData() {
        tableView?.mj_header.beginRefreshing()
    }
    
    func beginHeaderRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [unowned self] in
            self.endHeaderRefreshing()
        }
        dataController.requestNewsDataWithCallback(callback: { [unowned self] in
            self.tableView?.mj_header.endRefreshing()
            self.renderTableViewCell()
        }())
    }
    
    func beginFooterRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [unowned self] in
            self.tableView?.mj_footer.endRefreshing()
        }
        self.dataController.requestMoreNews(callback: { [unowned self] in
            self.tableView?.mj_footer.endRefreshing()
            DispatchQueue.main.async(execute: {
                self.tableView?.reloadData()
            })
        }())
    }
    
    func endHeaderRefreshing() {
        if (tableView?.mj_header.isRefreshing())! {
            tableView?.mj_header.endRefreshing()
        }
    }
    
    func renderTableViewCell() {
        let banners = NSArray(array: (dataController.bannerDataSource)!)
        headerViewModel = DHNewsBannerViewModel(banners: banners as! [DHNewsModel])
        DispatchQueue.main.async(execute: { [unowned self] in
            self.tableView?.tableHeaderView = self.headerView
            self.updateCycleView()
            self.loadingView?.isHidden = true
            self.tableView?.reloadData()
        })
    }
    
    func updateCycleView() {
        self.headerView.imageURLStringsGroup = self.headerViewModel?.imageUrlStrings
        self.headerView.titlesGroup = self.headerViewModel?.titleStrings
        self.headerView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated
        self.headerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
    }
    
    func loadToDetailVCWithNewsModel(newsModel: DHNewsModel) {
        let newsDetailVC: DHNewsDetailViewController = DHNewsDetailViewController()
        newsDetailVC.newsModel = newsModel;
        navigationController?.pushViewController(newsDetailVC, animated: true)
    }
    
// MARK: - Life Cycle
    override func reachabilityChanged(note: NSNotification) {
        let reachability = note.object as! Reachability
        if reachability.isReachable {
            noNetworkView?.hide()
            handleNewsData()
        } else {
            DHLog("Network not reachable")
            noNetworkView?.show()
        }
    }
    
    func setContentView() {
        tableView = UITableView.init(frame: CGRect(x: 0, y: kNavigationHeight + kStatusBarHeight, width: view.bounds.size.width, height: view.bounds.size.height - kNavigationHeight - kStatusBarHeight), style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UINib(nibName: "DHNewsTableViewCell", bundle: nil), forCellReuseIdentifier: kNewsCellReuseIdentifier)
        tableView?.mj_header = MJRefreshNormalHeader(refreshingBlock: { [unowned self] in
            self.beginHeaderRefreshing()
        })
        self.tableView?.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: { [unowned self] in
            self.beginFooterRefreshing()
        })
        view.addSubview(tableView!)
        loadingView = addLoadingViewForViewController(self)
        noNetworkView = addNoNetworkViewForViewController(self)
    }
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.orange
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        navigationItem.title = "掌刀"
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        setContentView()
    }
    
}

// MARK: - UITableViewDelegate
extension DHNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataController.newsDataSource?.count)! > 0 ? (dataController.newsDataSource?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kNewsTableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DHNewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: kNewsCellReuseIdentifier, for: indexPath) as! DHNewsTableViewCell
        if (dataController.newsDataSource?.count)! > 0 {
            let newsModel = dataController.newsDataSource?[indexPath.row] as! DHNewsModel
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
}

// MARK: - UIViewControllerPreviewingDelegate
@available(iOS 9.0, *)
extension DHNewsViewController: UIViewControllerPreviewingDelegate {
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
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}

extension DHNewsViewController: SDCycleScrollViewDelegate {
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        let banner: DHNewsModel = (headerViewModel?.banners![index])!
        loadToDetailVCWithNewsModel(newsModel: banner)
    }
}
