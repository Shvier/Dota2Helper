//
//  DHVideoViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit

class DHVideoViewController: UITableViewController {

    var dataController: DHVideoDataController?
    
    func handleVideoData() {
        dataController = DHVideoDataController()
        dataController?.requestVideoDataWithCallback(callback: {
            self.renderTableViewCell()
        }())
    }
    
    func renderTableViewCell() {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataController?.videoDataSource?.count)! > 0 ? (dataController?.videoDataSource?.count)! : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kVideoCellReuseIdentifier, for: indexPath) as! DHVideoTableViewCell
        if (dataController?.videoDataSource?.count)! > 0 {
            let videoModel = dataController?.videoDataSource?[indexPath.row] as! DHVideoModel
            let cellViewModel: DHVideoCellViewModel = DHVideoCellViewModel.init(videoModel: videoModel)
            cell.bindDataWithViewModel(viewModel: cellViewModel)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kTutorialTableViewCellHeight
    }
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        navigationItem.title = "掌刀"
    }
    
    func setContentView() {
        tableView.register(UINib(nibName: "DHVideoTableViewCell", bundle: nil), forCellReuseIdentifier: kVideoCellReuseIdentifier)
        let menu: UISegmentedMenu = UISegmentedMenu(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50), contentDataSource: [""], titleDataSource: ["全部", "解说", "比赛", "明星", "趣味", "新手"], type: .fill)
        view.addSubview(menu)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        setContentView()
        handleVideoData()
    }
    
}
