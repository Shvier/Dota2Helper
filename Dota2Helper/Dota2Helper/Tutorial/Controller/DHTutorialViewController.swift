//
//  DHTutorialViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit
import MJRefresh

class DHTutorialViewController: UIViewController, UISegmentedMenuDelegate {
    
    enum TutorialCategory: NSInteger {
        case ALL = 0,
        NEWER,
        STEP,
        SKILL
    }
    
    var dataController: DHTutorialDataController?
    var tableView: UITableView?
    var loadingView: DHLoadingView?
    var menu: UISegmentedMenu?
    
    func handleTutorialData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView?.mj_header.endRefreshing()
        }
        dataController = DHTutorialDataController()
        dataController?.requestTutorialAllWithCallback(callback: {
            self.renderTableViewCell()
        }())
    }
    
    func renderTableViewCell() {
        DispatchQueue.main.async(execute: {
            self.loadingView?.isHidden = true
            self.tableView?.reloadData()
        })
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
    }
    
    func segmentedMenu(didSelectIndex index: NSInteger) {
        if let dataType = TutorialCategory(rawValue: index) {
            switch dataType {
            case .ALL:
                dataController?.requestTutorialAllWithCallback(callback: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.tableView?.mj_header.endRefreshing()
                    }
                    self.renderTableViewCell()
                }())
                break
            case .NEWER:
                dataController?.requestTutorialNewerWithCallback(callback: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.tableView?.mj_header.endRefreshing()
                    }
                    self.renderTableViewCell()
                }())
                break
            case .STEP:
                dataController?.requestTutorialStepWithCallback(callback: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.tableView?.mj_header.endRefreshing()
                    }
                    self.renderTableViewCell()
                }())
                break
            case .SKILL:
                dataController?.requestTutorialSkillWithCallback(callback: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.tableView?.mj_header.endRefreshing()
                    }
                    self.renderTableViewCell()
                }())
                break
            }
        }
    }
    
    func loadToDetailVCWithTutorialModel(tutorialModel: DHTutorialModel) {
        let tutorialDetailVC: DHTutorialDetailViewController = DHTutorialDetailViewController()
        tutorialDetailVC.tutorialModel = tutorialModel;
        navigationController?.pushViewController(tutorialDetailVC, animated: true)
    }
    
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        navigationItem.title = "掌刀"
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    func setContentView() {
        menu = UISegmentedMenu(frame: CGRect(x: 0, y: 60, width: view.bounds.size.width, height: 50), contentDataSource: [""], titleDataSource: ["全部", "新手", "进阶", "技巧"], type: .fill)
        menu?.delegate = self
        view.addSubview(menu!)
        tableView = UITableView(frame: CGRect(x: 0, y: 60 + (menu?.bounds.size.height)!, width: view.bounds.size.width, height: view.bounds.size.height - 60 - (menu?.bounds.size.height)!), style: .plain)
        tableView?.register(UINib(nibName: "DHTutorialTableViewCell", bundle: nil), forCellReuseIdentifier: kTutorialCellReuseIdentifier)
        tableView?.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            let currentIndex = self.menu?.currentSelectedIndex()
            if let tutorialType = TutorialCategory(rawValue: currentIndex!) {
                switch tutorialType {
                    case .ALL:
                        self.dataController?.requestTutorialAllWithCallback(callback: {
                           self.renderTableViewCell()
                        }())
                    break
                    case .NEWER:
                        self.dataController?.requestTutorialNewerWithCallback(callback: {
                           self.renderTableViewCell()
                        }())
                    break
                    case .STEP:
                        self.dataController?.requestTutorialStepWithCallback(callback: {
                            self.renderTableViewCell()
                        }())
                    break
                    case .SKILL:
                        self.dataController?.requestTutorialSkillWithCallback(callback: {
                            self.renderTableViewCell()
                        }())
                    break
                }
            }
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

// MARK: - UITableViewDelegate
extension DHTutorialViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataController?.tutorialDataSource?.count)! > 0 ? (dataController?.tutorialDataSource?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTutorialCellReuseIdentifier, for: indexPath) as! DHTutorialTableViewCell
        if (dataController?.tutorialDataSource?.count)! > 0 {
            let tutorialModel = dataController?.tutorialDataSource?[indexPath.row] as! DHTutorialModel
            let cellViewModel: DHTutorialCellViewModel = DHTutorialCellViewModel.init(tutorialModel: tutorialModel)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kTutorialTableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell: DHTutorialTableViewCell = tableView.cellForRow(at: indexPath) as! DHTutorialTableViewCell
        loadToDetailVCWithTutorialModel(tutorialModel: cell.tutorialModel!)
    }
}

// MARK: - UIViewControllerPreviewingDelegate
@available(iOS 9.0, *)
extension DHTutorialViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let tutorialDetailVC: DHTutorialDetailViewController = DHTutorialDetailViewController()
        let cell: DHTutorialTableViewCell = previewingContext.sourceView as! DHTutorialTableViewCell
        tutorialDetailVC.tutorialModel = cell.tutorialModel
        return tutorialDetailVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}
