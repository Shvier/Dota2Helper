//
//  DHVideoViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit
import MJRefresh

class DHVideoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISegmentedMenuDelegate {

    var dataController: DHVideoDataController?
    var tableView: UITableView?
    var loadingView: DHLoadingView?
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
    
    func handleVideoData() {
        endHeaderRefreshing()
        dataController = DHVideoDataController()
        dataController?.requestVideoAllWithCallback(callback: {
            self.renderTableViewCell()
        }())
    }
    
    func endHeaderRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView?.mj_header.endRefreshing()
        }
    }
    
    func renderTableViewCell() {
        DispatchQueue.main.async(execute: {
            self.loadingView?.isHidden = true
            self.tableView?.reloadData()
        })
        self.tableView?.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.tableView?.mj_footer.endRefreshing()
            }
            self.dataController?.requestMoreVideo(callback: {
                self.tableView?.mj_footer.endRefreshing()
                DispatchQueue.main.async(execute: {
                    self.tableView?.reloadData()
                })
                }())
        })
        self.tableView?.mj_header.endRefreshing()
    }
    
    func segmentedMenu(didSelectIndex index: NSInteger) {
        if let videoType = VideoType(rawValue: index) {
            switch videoType {
            case .ALL:
                dataController?.requestVideoAllWithCallback(callback: {
                    self.renderTableViewCell()
                }())
                break
            case .JIESHUO:
                dataController?.requestVideoJieshuoWithCallback(callback: {
                    self.renderTableViewCell()
                }())
                break
            case .BISAI:
                dataController?.requestVideoBisaiWithCallback(callback: {
                    self.renderTableViewCell()
                }())
                break
            case .CELEBRITY:
                dataController?.requestVideoCelebrityWithCallback(callback: {
                    self.renderTableViewCell()
                }())
                break
            case .QUWEI:
                dataController?.requestVideoQuweiWithCallback(callback: {
                    self.renderTableViewCell()
                }())
                break
            case .BEGINNER:
                dataController?.requestVideoBeginnerWithCallback(callback: {
                    self.renderTableViewCell()
                }())
                break
            case .ADVANCED:
                dataController?.requestVideoAdvancedWithCallback(callback: {
                    self.renderTableViewCell()
                }())
                break
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataController?.videoDataSource?.count)! > 0 ? (dataController?.videoDataSource?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kVideoCellReuseIdentifier, for: indexPath) as! DHVideoTableViewCell
        if (dataController?.videoDataSource?.count)! > 0 {
            let videoModel = dataController?.videoDataSource?[indexPath.row] as! DHVideoModel
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
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        navigationItem.title = "掌刀"
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    func setContentView() {
        menu = UISegmentedMenu(frame: CGRect(x: 0, y: 60, width: view.bounds.size.width, height: 50), contentDataSource: [""], titleDataSource: ["全部", "解说", "比赛", "明星", "趣味", "新手", "进阶"], type: .fill)
        menu?.delegate = self
        view.addSubview(menu!)
        tableView = UITableView(frame: CGRect(x: 0, y: 60 + (menu?.bounds.size.height)!, width: view.bounds.size.width, height: view.bounds.size.height - 60 - (menu?.bounds.size.height)!), style: .plain)
        tableView?.register(UINib(nibName: "DHVideoTableViewCell", bundle: nil), forCellReuseIdentifier: kVideoCellReuseIdentifier)
        tableView?.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            let currentIndex = self.menu?.currentSelectedIndex()
            if let videoType = VideoType(rawValue: currentIndex!) {
                switch videoType {
                    case .ALL:
                        self.dataController?.requestVideoAllWithCallback(callback: {
                            self.endHeaderRefreshing()
                            self.renderTableViewCell()
                        }())
                    break
                    case .JIESHUO:
                        self.dataController?.requestVideoJieshuoWithCallback(callback: {
                            self.endHeaderRefreshing()
                            self.renderTableViewCell()
                        }())
                    break
                    case .BISAI:
                        self.dataController?.requestVideoBisaiWithCallback(callback: {
                            self.endHeaderRefreshing()
                            self.renderTableViewCell()
                        }())
                    break
                    case .CELEBRITY:
                        self.dataController?.requestVideoCelebrityWithCallback(callback: {
                            self.endHeaderRefreshing()
                            self.renderTableViewCell()
                        }())
                    break
                    case .QUWEI:
                        self.dataController?.requestVideoQuweiWithCallback(callback: {
                            self.endHeaderRefreshing()
                            self.renderTableViewCell()
                        }())
                    break
                    case .BEGINNER:
                        self.dataController?.requestVideoBeginnerWithCallback(callback: {
                            self.endHeaderRefreshing()
                            self.renderTableViewCell()
                        }())
                    break
                    case .ADVANCED:
                        self.dataController?.requestVideoAdvancedWithCallback(callback: {
                            self.endHeaderRefreshing()
                            self.renderTableViewCell()
                        }())
                    break
                }
            }
        })
        view.addSubview(tableView!)
        tableView?.delegate = self
        tableView?.dataSource = self
        loadingView = DHLoadingView(frame: tableView!.frame)
        view.addSubview(loadingView!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        setContentView()
        handleVideoData()
    }
    
}
