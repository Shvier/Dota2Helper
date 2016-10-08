//
//  DHVideoViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit
import MJRefresh

class DHVideoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataController: DHVideoDataController?
    var tableView: UITableView?
    
    func handleVideoData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView?.mj_header.endRefreshing()
        }
        dataController = DHVideoDataController()
        dataController?.requestVideoDataWithCallback(callback: {
            self.renderTableViewCell()
            tableView?.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
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
        }())
    }
    
    func renderTableViewCell() {
        DispatchQueue.main.async(execute: {
            self.tableView?.reloadData()
        })
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
    }
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        navigationItem.title = "掌刀"
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    func setContentView() {
        let menu: UISegmentedMenu = UISegmentedMenu(frame: CGRect(x: 0, y: 60, width: view.bounds.size.width, height: 50), contentDataSource: [""], titleDataSource: ["全部", "解说", "比赛", "明星", "趣味", "新手"], type: .fill)
        view.addSubview(menu)
        tableView = UITableView(frame: CGRect(x: 0, y: 60 + menu.bounds.size.height, width: view.bounds.size.width, height: view.bounds.size.height - 60 - menu.bounds.size.height), style: .plain)
        tableView?.register(UINib(nibName: "DHVideoTableViewCell", bundle: nil), forCellReuseIdentifier: kVideoCellReuseIdentifier)
        tableView?.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.handleVideoData()
        })
        view.addSubview(tableView!)
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        setContentView()
        handleVideoData()
    }
    
}
