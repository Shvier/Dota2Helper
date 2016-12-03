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
    
    lazy var cellViewModel: DHVideoCellViewModel = {
        return DHVideoCellViewModel()
    }()
    
    let kTopOffset: CGFloat = 60
    
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
                self.cellViewModel.getAllVideos(success: {
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }(), failure: {} ())
                break
            case .JIESHUO:
                self.cellViewModel.getJieshuoVideos(success: {
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }(), failure: {} ())
                break
            case .BISAI:
                self.cellViewModel.getBisaiVideos(success: {
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }(), failure: {} ())
                break
            case .CELEBRITY:
                self.cellViewModel.getCelebrityVideos(success: {
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }(), failure: {} ())
                break
            case .QUWEI:
                self.cellViewModel.getQuweiVideos(success: {
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }(), failure: {} ())
                break
            case .BEGINNER:
                self.cellViewModel.getBeginnerVideos(success: {
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }(), failure: {} ())
                break
            case .ADVANCED:
                self.cellViewModel.getAdvancedVideos(success: {
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }(), failure: {} ())
                break
            }
        }
    }
    
    func beginFooterRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [unowned self] in
            self.tableView?.mj_footer.endRefreshing()
        }
        let currentIndex = self.menu?.currentSelectedIndex()
        if let videoType = VideoType(rawValue: currentIndex!) {
            switch videoType {
            case .ALL:
                self.cellViewModel.loadMoreAllVideos(vid: (self.cellViewModel.videoDataSource.last?.vid)!, success: {
                    DispatchQueue.main.async(execute: {
                        self.tableView?.reloadData()
                    })
                }(), failure: {} ())
                break
            case .JIESHUO:
                self.cellViewModel.loadMoreJieshuoVideos(vid: (self.cellViewModel.videoDataSource.last?.vid)!, success: {
                    DispatchQueue.main.async(execute: {
                        self.tableView?.reloadData()
                    })
                }(), failure: {} ())
                break
            case .BISAI:
                self.cellViewModel.loadMoreBisaiVideos(vid: (self.cellViewModel.videoDataSource.last?.vid)!, success: {
                    DispatchQueue.main.async(execute: {
                        self.tableView?.reloadData()
                    })
                }(), failure: {} ())
                break
            case .CELEBRITY:
                self.cellViewModel.loadMoreCelebrityVideos(vid: (self.cellViewModel.videoDataSource.last?.vid)!, success: {
                    DispatchQueue.main.async(execute: {
                        self.tableView?.reloadData()
                    })
                }(), failure: {} ())
                break
            case .QUWEI:
                self.cellViewModel.loadMoreQuweiVideos(vid: (self.cellViewModel.videoDataSource.last?.vid)!, success: {
                    DispatchQueue.main.async(execute: {
                        self.tableView?.reloadData()
                    })
                }(), failure: {} ())
                break
            case .BEGINNER:
                self.cellViewModel.loadMoreBeginnerVideos(vid: (self.cellViewModel.videoDataSource.last?.vid)!, success: {
                    DispatchQueue.main.async(execute: {
                        self.tableView?.reloadData()
                    })
                }(), failure: {} ())
                break
            case .ADVANCED:
                self.cellViewModel.loadMoreAdvancedVideos(vid: (self.cellViewModel.videoDataSource.last?.vid)!, success: {
                    DispatchQueue.main.async(execute: {
                        self.tableView?.reloadData()
                    })
                }(), failure: {} ())
                break
            }
        }
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
    
    func handleVideoData() {
        tableView?.mj_header.beginRefreshing()
    }
    
    func setContentView() {
        menu = UISegmentedMenu(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: kSegmentedMenuHeight), contentDataSource: [""], titleDataSource: ["全部", "解说", "比赛", "明星", "趣味", "新手", "进阶"], type: .fill)
        menu?.delegate = self
        tableView = UITableView(frame: CGRect(x: 0, y: (menu?.bounds.size.height)!, width: view.bounds.size.width, height: view.bounds.size.height - (menu?.bounds.size.height)!), style: .plain)
        tableView?.backgroundColor = kTableViewBackgroundColor
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
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kTabBarItemColor]
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
        return cellViewModel.videoDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kVideoCellReuseIdentifier, for: indexPath) as! DHVideoTableViewCell
        cell.bindDataWithModel(model: cellViewModel.videoDataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kVideoTableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        setNaviAndTabStatus(isHidden: false)
        let cell: DHVideoTableViewCell = tableView.cellForRow(at: indexPath) as! DHVideoTableViewCell
        let playerVC = DHVideoDetailViewController()
        playerVC.ykvid = cell.ykvid;
        navigationController?.pushViewController(playerVC, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y + (tableView?.contentInset.top)!
        let panTranslationY = scrollView.panGestureRecognizer.translation(in: tableView).y
        if offsetY > 64 {
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

// MARK: - UISegmentedMenuDelegate
extension DHVideoViewController: UISegmentedMenuDelegate {
    func segmentedMenu(didSelectIndex index: NSInteger) {
        endHeaderRefreshing()
        tableView?.mj_header.beginRefreshing()
    }
}
