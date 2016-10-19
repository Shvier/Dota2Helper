//
//  DHVideoViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit
import MJRefresh
import ReachabilitySwift

class DHVideoViewController: DHBaseViewController {
    
    let kTopOffset: CGFloat = 60
    
    lazy var dataController: DHVideoDataController = {
        return DHVideoDataController()
    }()
    var tableView: UITableView?
    var loadingView: DHLoadingView?
    var noNetworkView: DHNoNetworkView?
    var menu: UISegmentedMenu?
    
    enum VideoType: NSInteger {
        case ALL = 0,
        JIESHUO,
        BISAI,
        CELEBRITY,
        QUWEI,
        BEGINNER,
        ADVANCED
    }
    
// MARK: - Data Handler and View Renderer
    func endHeaderRefreshing() {
        if (tableView?.mj_header.isRefreshing())! {
            tableView?.mj_header.endRefreshing()
        }
    }
    
    func beginHeaderRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: { [unowned self] in
            self.endHeaderRefreshing()
        })
        let currentIndex = self.menu?.currentSelectedIndex()
        if let videoType = VideoType(rawValue: currentIndex!) {
            switch videoType {
            case .ALL:
                self.dataController.requestVideoAllWithCallback(callback: {
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }())
                break
            case .JIESHUO:
                self.dataController.requestVideoJieshuoWithCallback(callback: {
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }())
                break
            case .BISAI:
                self.dataController.requestVideoBisaiWithCallback(callback: {
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }())
                break
            case .CELEBRITY:
                self.dataController.requestVideoCelebrityWithCallback(callback: {
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }())
                break
            case .QUWEI:
                self.dataController.requestVideoQuweiWithCallback(callback: {
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }())
                break
            case .BEGINNER:
                self.dataController.requestVideoBeginnerWithCallback(callback: {
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }())
                break
            case .ADVANCED:
                self.dataController.requestVideoAdvancedWithCallback(callback: {
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }())
                break
            }
        }
    }
    
    func beginFooterRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [unowned self] in
            self.tableView?.mj_footer.endRefreshing()
        }
        self.dataController.requestMoreVideo(callback: { [unowned self] in
            self.tableView?.mj_footer.endRefreshing()
            DispatchQueue.main.async(execute: {
                self.tableView?.reloadData()
            })
        }())
    }
    
    func renderTableViewCell() {
        DispatchQueue.main.async(execute: { [unowned self] in
            self.loadingView?.isHidden = true
            self.tableView?.reloadData()
        })
    }
    
// MARK: - Lift Cycle
    override func reachabilityChanged(note: NSNotification) {
        let reachability = note.object as! Reachability
        if reachability.isReachable {
            noNetworkView?.hide()
            handleVideoData()
        } else {
            DHLog("Network not reachable")
            noNetworkView?.show()
        }
    }
    
    func handleVideoData() {
        tableView?.mj_header.beginRefreshing()
    }
    
    func setContentView() {
        menu = UISegmentedMenu(frame: CGRect(x: 0, y: kTopOffset, width: view.bounds.size.width, height: kSegmentedMenuHeight), contentDataSource: [""], titleDataSource: ["全部", "解说", "比赛", "明星", "趣味", "新手", "进阶"], type: .fill)
        menu?.delegate = self
        tableView = UITableView(frame: CGRect(x: 0, y: kTopOffset + (menu?.bounds.size.height)!, width: view.bounds.size.width, height: view.bounds.size.height - kTopOffset - (menu?.bounds.size.height)!), style: .plain)
        tableView?.register(UINib(nibName: "DHVideoTableViewCell", bundle: nil), forCellReuseIdentifier: kVideoCellReuseIdentifier)
        tableView?.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.beginHeaderRefreshing()
        })
        tableView?.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
            self.beginFooterRefreshing()
        })
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(menu!)
        view.addSubview(tableView!)
        loadingView = addLoadingViewForViewController(self)
        noNetworkView = addNoNetworkViewForViewController(self)
    }
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        navigationItem.title = "掌刀"
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        setContentView()
        handleVideoData()
    }
    
}

// MARK: - UITableViewDelegate
extension DHVideoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataController.videoDataSource?.count)! > 0 ? (dataController.videoDataSource?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kVideoCellReuseIdentifier, for: indexPath) as! DHVideoTableViewCell
        if (dataController.videoDataSource?.count)! > 0 {
            let videoModel = dataController.videoDataSource?[indexPath.row] as! DHVideoModel
            let cellViewModel: DHVideoCellViewModel = DHVideoCellViewModel.init(videoModel: videoModel)
            cell.bindDataWithViewModel(viewModel: cellViewModel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kTutorialTableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell: DHVideoTableViewCell = tableView.cellForRow(at: indexPath) as! DHVideoTableViewCell
        let playerVC = DHVideoPlayViewController()
        playerVC.ykvid = cell.ykvid
        navigationController?.pushViewController(playerVC, animated: true)
    }
}

// MARK: - UISegmentedMenuDelegate
extension DHVideoViewController: UISegmentedMenuDelegate {
    func segmentedMenu(didSelectIndex index: NSInteger) {
        endHeaderRefreshing()
        tableView?.mj_header.beginRefreshing()
    }
}
