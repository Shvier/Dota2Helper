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

// MARK: - Lazy Var
    lazy var headerView: SDCycleScrollView = {
        return SDCycleScrollView(frame: CGRect(x: 0, y: 0, width: kBannerWidth, height: kBannerHeight), delegate: self, placeholderImage: UIImage(named: "placeholder.jpg"))
    }()
    lazy var viewModel: DHNewsCellViewModel = {
        return DHNewsCellViewModel()
    }()
    
    var tableView: UITableView?
    var loadingView: DHLoadingView?
    var noNetworkView: DHNoNetworkView?
    var lastScrollOffetY: CGFloat?
    
    lazy var bannerDataSource: [DHNewsModel]? = {[]} ()
    lazy var newsDataSource: [DHNewsModel]? = {[]} ()
    lazy var imageUrlStrings: [String]? = {[]} ()
    lazy var titleUrlStrings: [String]? = {[]} ()
    
// MARK: - Data Handler and View Renderer
    func handleNewsData() {
        tableView?.mj_header.beginRefreshing()
    }
    
    func beginHeaderRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [unowned self] in
            self.endHeaderRefreshing()
        }
        viewModel.refreshNews({ [unowned self] (newsDict) in
            self.tableView?.mj_header.endRefreshing()
            self.bannerDataSource = newsDict["banner"] as? [DHNewsModel]
            self.newsDataSource = newsDict["news"] as? [DHNewsModel]
            self.imageUrlStrings = newsDict["imageUrl"] as? [String]
            self.titleUrlStrings = newsDict["titleUrl"] as? [String]
            self.renderTableViewCell()
        }, failure: {} ())
    }
    
    func beginFooterRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [unowned self] in
            self.tableView?.mj_footer.endRefreshing()
        }
        viewModel.loadMoreNews(nid: (newsDataSource?.last?.nid)!, success: { [unowned self] (newsArray) in
            self.newsDataSource?.append(contentsOf: newsArray)
            DispatchQueue.main.async(execute: {
                self.tableView?.reloadData()
            })
        }, failure: {} ())
    }
    
    func endHeaderRefreshing() {
        if (tableView?.mj_header.isRefreshing())! {
            tableView?.mj_header.endRefreshing()
        }
    }
    
    func renderTableViewCell() {
        DispatchQueue.main.async(execute: { [unowned self] in
            self.tableView?.tableHeaderView = self.headerView
            self.updateCycleView()
            self.loadingView?.isHidden = true
            self.tableView?.reloadData()
        })
    }
    
    func updateCycleView() {
        self.headerView.imageURLStringsGroup = imageUrlStrings
        self.headerView.titlesGroup = titleUrlStrings
        self.headerView.showPageControl = false
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
            let alertController: UIAlertController = UIAlertController(title: "无法连接网络", message: nil, preferredStyle: .alert)
            let openNetAction: UIAlertAction = UIAlertAction(title: "设置", style: .default, handler: { (UIAlertAction) in
                UIApplication.shared.openURL(URL(string: UIApplicationOpenSettingsURLString)!)
            })
            let cancelAction: UIAlertAction = UIAlertAction(title: "好", style: .default, handler: { (UIAlertAction) in
                alertController.dismiss(animated: true, completion: nil)
            })
            alertController.addAction(openNetAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
            noNetworkView?.show()
        }
    }
    
    func setContentView() {
        tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height), style: .plain)
        tableView?.backgroundColor = kTableViewBackgroundColor
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lastScrollOffetY = 0
        setContentView()
        tableView?.mj_header.beginRefreshing()
    }
    
}

// MARK: - UITableViewDelegate
extension DHNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (newsDataSource?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kNewsTableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DHNewsTableViewCell = DHNewsTableViewCell.cell(tableView: tableView, indexPath: indexPath)
        cell.bindDataWithModel(model: newsDataSource![indexPath.row])
        if #available(iOS 9.0, *) {
            if traitCollection.forceTouchCapability == .available {
                registerForPreviewing(with: self, sourceView: cell)
            }
        } else {
            // Fallback on earlier versions
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        setNaviAndTabStatus(isHidden: false)
        let cell: DHNewsTableViewCell = tableView.cellForRow(at: indexPath) as! DHNewsTableViewCell
        loadToDetailVCWithNewsModel(newsModel: cell.newsModel!)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y + (tableView?.contentInset.top)!
        let panTranslationY = scrollView.panGestureRecognizer.translation(in: tableView).y
        if offsetY > kNavigationHeight + kStatusBarHeight {
            if panTranslationY > 0 {
                setNaviAndTabStatus(isHidden: false)
            } else {
                setNaviAndTabStatus(isHidden: true)
            }
        } else {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
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
        }
        return newsDetailVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}

extension DHNewsViewController: SDCycleScrollViewDelegate {
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        let banner: DHNewsModel = bannerDataSource![index]
        loadToDetailVCWithNewsModel(newsModel: banner)
    }
}
