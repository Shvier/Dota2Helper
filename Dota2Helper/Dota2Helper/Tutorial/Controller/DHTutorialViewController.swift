//
//  DHTutorialViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit

class DHTutorialViewController: UITableViewController {
    
    var dataController: DHTutorialDataController?
    
    func handleTutorialData() {
        dataController = DHTutorialDataController()
        dataController?.requestTutorialDataWithCallback(callback: {
            self.renderTableViewCell()
        }())
    }
    
    func renderTableViewCell() {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataController?.tutorialDataSource?.count)! > 0 ? (dataController?.tutorialDataSource?.count)! : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTutorialCellReuseIdentifier, for: indexPath) as! DHTutorialTableViewCell
        if (dataController?.tutorialDataSource?.count)! > 0 {
            let tutorialModel = dataController?.tutorialDataSource?[indexPath.row] as! DHTutorialModel
            let cellViewModel: DHTutorialCellViewModel = DHTutorialCellViewModel.init(tutorialModel: tutorialModel)
            cell.bindDataWithViewModel(viewModel: cellViewModel)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kTutorialTableViewCellHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        navigationItem.title = "掌刀"
    }
    
    func setContentView() {
        tableView.register(UINib(nibName: "DHTutorialTableViewCell", bundle: nil), forCellReuseIdentifier: kTutorialCellReuseIdentifier)
        let menu: UISegmentedMenu = UISegmentedMenu(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50), contentDataSource: [""], titleDataSource: ["全部", "新手", "进阶", "技巧"], type: .fill)
        view.addSubview(menu)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        setContentView()
        handleTutorialData()
    }
    
}
