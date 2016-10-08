//
//  DHJournalViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit
import MJRefresh

class DHJournalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataController: DHJournalDataController?
    var tableView: UITableView?
    var loadingView: DHLoadingView?
    
    func handleJournalData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView?.mj_header.endRefreshing()
        }
        dataController = DHJournalDataController()
        dataController?.requestJournalDataWithCallback(callback: {
            self.renderTableViewCell()
            tableView?.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.tableView?.mj_footer.endRefreshing()
                }
                self.dataController?.requestMoreJournal(callback: {
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
    
    func loadToDetailVCWithJournalModel(journalModel: DHJournalModel) {
        let journalDetailVC: DHJournalDetailViewController = DHJournalDetailViewController()
        journalDetailVC.journalModel = journalModel
        navigationController?.pushViewController(journalDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataController?.journalDataSource?.count)! > 0 ? (dataController?.journalDataSource?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kJournalTableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DHJournalTableViewCell = tableView.dequeueReusableCell(withIdentifier: kJournalCellReuseIdentifier, for: indexPath) as! DHJournalTableViewCell
        if (dataController?.journalDataSource?.count)! > 0 {
            let journalModel = dataController?.journalDataSource?[indexPath.row] as! DHJournalModel
            let cellViewModel: DHJournalViewModel = DHJournalViewModel(journal: journalModel)
            cell.bindDataWithViewModel(viewModel: cellViewModel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (dataController?.journalDataSource?.count)! > 0 {
            let cell: DHJournalTableViewCell = tableView.cellForRow(at: indexPath) as! DHJournalTableViewCell
            loadToDetailVCWithJournalModel(journalModel: cell.journalModel!)
        }
    }
    
    func setContentView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.register(UINib(nibName: "DHJournalTableViewCell", bundle: nil), forCellReuseIdentifier: kJournalCellReuseIdentifier)
        tableView?.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.handleJournalData()
        })
        tableView?.delegate = self
        tableView?.dataSource = self
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
        handleJournalData()
    }
    
}
