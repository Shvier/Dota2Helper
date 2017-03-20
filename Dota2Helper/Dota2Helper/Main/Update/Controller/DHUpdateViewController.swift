//
//  DHUpdateViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit
import MJRefresh
import ReachabilitySwift

class DHUpdateViewController: DHBaseViewController {

    lazy var viewModel: DHUpdateCellViewModel = {
        return DHUpdateCellViewModel()
    }()
    
    var tableView: UITableView?
    var loadingView: DHLoadingView?
    var noNetworkView: DHNoNetworkView?
    
// MARK: - Data Handler and View Renderer
    func handleUpdateData() {
        tableView?.mj_header.beginRefreshing()
    }
    
    func beginHeaderRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [unowned self] in
            self.endHeaderRefreshing()
        }

        viewModel.refreshUpdate({ [unowned self] in
            self.tableView?.mj_header.endRefreshing()
            self.renderTableViewCell()
        }(), failure: {} ())
    }
    
    func beginFooterRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [unowned self] in
            self.tableView?.mj_footer.endRefreshing()
        }
        viewModel.loadMoreUpdate(nid: (viewModel.updateDataSource.last?.nid)!, success: {
            DispatchQueue.main.async(execute: {
                self.tableView?.reloadData()
            })
        }(), failure: {} ())
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
    
    func loadToDetailVCWithUpdateModel(updateModel: DHUpdateModel) {
        let updateDetailVC: DHUpdateDetailViewController = DHUpdateDetailViewController()
        updateDetailVC.updateModel = updateModel
        navigationController?.pushViewController(updateDetailVC, animated: true)
    }
    
// MARK: - Life Cycle
    override func reachabilityChanged(note: NSNotification) {
        guard let reachability = note.object as? Reachability else {
            return
        }
        if reachability.isReachable {
            noNetworkView?.hide()
            handleUpdateData()
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
        tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height), style: .plain)
        tableView?.backgroundColor = kTableViewBackgroundColor
        tableView?.register(DHNewsTableViewCell.self, forCellReuseIdentifier: kUpdateCellReuseIdentifier)
        tableView?.mj_header = MJRefreshNormalHeader(refreshingBlock: { [unowned self] in
            self.beginHeaderRefreshing()
        })
        self.tableView?.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: { [unowned self] in
            self.beginFooterRefreshing()
        })
        tableView?.delegate = self
        tableView?.dataSource = self
        loadingView = DHLoadingView(frame: view.bounds)
        view.addSubview(tableView!)
        view.addSubview(loadingView!)
        noNetworkView = addNoNetworkViewForViewController(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setContentView()
        handleUpdateData()
    }
    
}

// MARK: - UITableViewDelegate
extension DHUpdateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.updateDataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kNewsTableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DHNewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: kUpdateCellReuseIdentifier, for: indexPath) as! DHNewsTableViewCell
//        cell.bindDataWithModel(model: viewModel.updateDataSource[indexPath.row])
        if #available(iOS 9.0, *) {
            if traitCollection.forceTouchCapability == .available {
                registerForPreviewing(with: self, sourceView: cell)
            }
        } else {
            // Fallback on earlier versions
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        setNaviAndTabStatus(isHidden: false)
//        let cell: DHNewsTableViewCell = tableView.cellForRow(at: indexPath) as! DHNewsTableViewCell
//        loadToDetailVCWithUpdateModel(updateModel: cell.updateModel!)
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

// MARK: UIViewControllerPreviewingDelegate
@available(iOS 9.0, *)
extension DHUpdateViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let updateDetailVC: DHUpdateDetailViewController = DHUpdateDetailViewController()
        let cell = previewingContext.sourceView as! DHNewsTableViewCell
//        updateDetailVC.updateModel = cell.updateModel
        return updateDetailVC
    }
}
