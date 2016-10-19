//
//  DHJournalViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit
import MJRefresh

class DHJournalViewController: UIViewController {

    var dataController: DHJournalDataController?
    var tableView: UITableView?
    var loadingView: DHLoadingView?
    
// MARK: - Data Handler and View Renderer
    func handleJournalData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [unowned self] in
            self.tableView?.mj_header.endRefreshing()
        }
        dataController = DHJournalDataController()
        dataController?.requestJournalDataWithCallback(callback: { [unowned self] in
            self.renderTableViewCell()
            self.tableView?.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
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
        DispatchQueue.main.async(execute: { [unowned self] in
            self.loadingView?.isHidden = true
            self.tableView?.reloadData()
        })
    }
    
    func loadToDetailVCWithJournalModel(journalModel: DHJournalModel) {
        let journalDetailVC: DHJournalDetailViewController = DHJournalDetailViewController()
        journalDetailVC.journalModel = journalModel
        navigationController?.pushViewController(journalDetailVC, animated: true)
    }
    
    func setContentView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.register(UINib(nibName: "DHJournalTableViewCell", bundle: nil), forCellReuseIdentifier: kJournalCellReuseIdentifier)
        tableView?.mj_header = MJRefreshNormalHeader(refreshingBlock: { [unowned self] in
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

// MARK: - UITableViewDelegate
extension DHJournalViewController: UITableViewDelegate, UITableViewDataSource {
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
        if (dataController?.journalDataSource?.count)! > 0 {
            let cell: DHJournalTableViewCell = tableView.cellForRow(at: indexPath) as! DHJournalTableViewCell
            loadToDetailVCWithJournalModel(journalModel: cell.journalModel!)
        }
    }
}

// MARK: UIViewControllerPreviewingDelegate
@available(iOS 9.0, *)
extension DHJournalViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let journalDetailVC: DHJournalDetailViewController = DHJournalDetailViewController()
        let cell = previewingContext.sourceView as! DHJournalTableViewCell
        journalDetailVC.journalModel = cell.journalModel
        return journalDetailVC
    }
}
