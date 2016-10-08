//
//  DHTutorialViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit
import MJRefresh

class DHTutorialViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataController: DHTutorialDataController?
    var tableView: UITableView?
    var loadingView: DHLoadingView?
    
    func handleTutorialData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView?.mj_header.endRefreshing()
        }
        dataController = DHTutorialDataController()
        dataController?.requestTutorialDataWithCallback(callback: {
            self.renderTableViewCell()
            tableView?.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.tableView?.mj_footer.endRefreshing()
                }
                self.dataController?.requestMoreTutorial(callback: {
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
            self.loadingView?.isHidden = true
            self.tableView?.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataController?.tutorialDataSource?.count)! > 0 ? (dataController?.tutorialDataSource?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTutorialCellReuseIdentifier, for: indexPath) as! DHTutorialTableViewCell
        if (dataController?.tutorialDataSource?.count)! > 0 {
            let tutorialModel = dataController?.tutorialDataSource?[indexPath.row] as! DHTutorialModel
            let cellViewModel: DHTutorialCellViewModel = DHTutorialCellViewModel.init(tutorialModel: tutorialModel)
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
        let menu: UISegmentedMenu = UISegmentedMenu(frame: CGRect(x: 0, y: 60, width: view.bounds.size.width, height: 50), contentDataSource: [""], titleDataSource: ["全部", "新手", "进阶", "技巧"], type: .fill)
        view.addSubview(menu)
        tableView = UITableView(frame: CGRect(x: 0, y: 60 + menu.bounds.size.height, width: view.bounds.size.width, height: view.bounds.size.height - 60 - menu.bounds.size.height), style: .plain)
        tableView?.register(UINib(nibName: "DHTutorialTableViewCell", bundle: nil), forCellReuseIdentifier: kTutorialCellReuseIdentifier)
        tableView?.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.handleTutorialData()
        })
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        loadingView = DHLoadingView(frame: tableView!.frame)
        view.addSubview(loadingView!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        setContentView()
        handleTutorialData()
    }
    
}
