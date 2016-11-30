//
//  DHStrategyViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit
import MJRefresh
import ReachabilitySwift

class DHStrategyViewController: DHBaseViewController {
    
    enum TutorialCategory: NSInteger {
        case ALL = 0,
        NEWER,
        STEP,
        SKILL
    }
    
    lazy var dataController: DHTutorialDataController = {
        return DHTutorialDataController()
    }()
    var tableView: UITableView?
    var loadingView: DHLoadingView?
    var menu: UISegmentedMenu?
    var noNetworkView: DHNoNetworkView?
    
// MARK: - Data Handler and View Renderer
    func handleTutorialData() {
        tableView?.mj_header.beginRefreshing()
    }
    
    func beginHeaderRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [unowned self] in
            self.endHeaderRefreshing()
        }
        let currentIndex = self.menu?.currentSelectedIndex()
        if let tutorialType = TutorialCategory(rawValue: currentIndex!) {
            switch tutorialType {
            case .ALL:
                self.dataController.requestTutorialAllWithCallback(callback: { [unowned self] in
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }())
                break
            case .NEWER:
                self.dataController.requestTutorialNewerWithCallback(callback: { [unowned self] in
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }())
                break
            case .STEP:
                self.dataController.requestTutorialStepWithCallback(callback: { [unowned self] in
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }())
                break
            case .SKILL:
                self.dataController.requestTutorialSkillWithCallback(callback: { [unowned self] in
                    self.endHeaderRefreshing()
                    self.renderTableViewCell()
                }())
                break
            }
        }
    }
    
    func beginFooterRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [unowned self] in
            self.tableView?.mj_footer.endRefreshing()
        }
        self.dataController.requestMoreTutorial(callback: { [unowned self] in
            self.tableView?.mj_footer.endRefreshing()
            DispatchQueue.main.async(execute: { [unowned self] in
                self.tableView?.reloadData()
            })
        }())
    }
    
    func endHeaderRefreshing() {
        if (tableView?.mj_header.isRefreshing())! {
            tableView?.mj_header.endRefreshing()
        }
    }
    
    func renderTableViewCell() {
        DispatchQueue.main.async(execute: { [unowned self] in
            self.loadingView?.isHidden = true
            self.tableView?.reloadData()
        })
    }
    
    func loadToDetailVCWithTutorialModel(strategyModel: DHStrategyModel) {
        let strategyDetailVC: DHStrategyDetailViewController = DHStrategyDetailViewController()
        strategyDetailVC.strategyModel = strategyModel;
        navigationController?.pushViewController(strategyDetailVC, animated: true)
    }
    
// MARK: - Life Cycle
    override func reachabilityChanged(note: NSNotification) {
        let reachability = note.object as! Reachability
        if reachability.isReachable {
            noNetworkView?.hide()
            handleTutorialData()
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
    
    func setContentView() {
        menu = UISegmentedMenu(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: kSegmentedMenuHeight), contentDataSource: [""], titleDataSource: ["全部", "新手", "进阶", "技巧"], type: .fill)
        menu?.delegate = self
        tableView = UITableView(frame: CGRect(x: 0, y: 0 + (menu?.bounds.size.height)!, width: view.bounds.size.width, height: view.bounds.size.height - (menu?.bounds.size.height)!), style: .plain)
        tableView?.backgroundColor = kTableViewBackgroundColor
        tableView?.register(UINib(nibName: "DHTutorialTableViewCell", bundle: nil), forCellReuseIdentifier: kTutorialCellReuseIdentifier)
        tableView?.mj_header = MJRefreshNormalHeader(refreshingBlock: { [unowned self] in
            self.beginHeaderRefreshing()
        })
        tableView?.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: { [unowned self] in
            self.beginFooterRefreshing()
        })
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(menu!)
        view.addSubview(tableView!)
        loadingView = addLoadingViewForViewController(self)
        noNetworkView = addNoNetworkViewForViewController(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContentView()
        handleTutorialData()
    }
    
}

// MARK: - UITableViewDelegate
extension DHStrategyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataController.tutorialDataSource?.count)! > 0 ? (dataController.tutorialDataSource?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTutorialCellReuseIdentifier, for: indexPath) as! DHStrategyTableViewCell
        if (dataController.tutorialDataSource?.count)! > 0 {
            let tutorialModel = dataController.tutorialDataSource?[indexPath.row] as! DHStrategyModel
            let cellViewModel: DHStrategyCellViewModel = DHStrategyCellViewModel.init(strategyModel: tutorialModel)
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
        return kStrategyTableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        setNaviAndTabStatus(isHidden: false)
        let cell: DHStrategyTableViewCell = tableView.cellForRow(at: indexPath) as! DHStrategyTableViewCell
        loadToDetailVCWithTutorialModel(strategyModel: cell.strategyModel!)
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

// MARK: - UIViewControllerPreviewingDelegate
@available(iOS 9.0, *)
extension DHStrategyViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let strategyDetailVC: DHStrategyDetailViewController = DHStrategyDetailViewController()
        let cell: DHStrategyTableViewCell = previewingContext.sourceView as! DHStrategyTableViewCell
        strategyDetailVC.strategyModel = cell.strategyModel
        return strategyDetailVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}

// MARK: - UISegmentedMenuDelegate
extension DHStrategyViewController: UISegmentedMenuDelegate {
    func segmentedMenu(didSelectIndex index: NSInteger) {
        endHeaderRefreshing()
        tableView?.mj_header.beginRefreshing()
    }
}
