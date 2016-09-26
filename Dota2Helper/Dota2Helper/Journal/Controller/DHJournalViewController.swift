//
//  DHJournalViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit

class DHJournalViewController: UITableViewController {

    var dataController: DHJournalDataController?
    
    func handleJournalData() {
        dataController = DHJournalDataController()
        dataController?.requestNewsDataWithCallback(callback: {
            self.renderTableViewCell()
        }())
    }
    
    func renderTableViewCell() {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataController?.newsDataSource?.count)! > 0 ? (dataController?.newsDataSource?.count)! : 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kJournalTableViewCellHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DHJournalTableViewCell = tableView.dequeueReusableCell(withIdentifier: kJournalCellReuseIdentifier, for: indexPath) as! DHJournalTableViewCell
        if (dataController?.newsDataSource?.count)! > 0 {
            let journalModel = dataController?.newsDataSource?[indexPath.row] as! DHJournalModel
            let cellViewModel: DHJournalViewModel = DHJournalViewModel(journal: journalModel)
            cell.bindDateWithViewModel(viewModel: cellViewModel)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setContentView() {
        tableView.register(UINib(nibName: "DHJournalTableViewCell", bundle: nil), forCellReuseIdentifier: kJournalCellReuseIdentifier)
    }
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationItem.title = "掌刀"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        initLifeCycle()
        setContentView()
        handleJournalData()
    }
    
}
