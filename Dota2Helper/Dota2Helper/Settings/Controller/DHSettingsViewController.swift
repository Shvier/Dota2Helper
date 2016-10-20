//
//  DHSettingsViewController.swift
//  Dota2Helper
//
//  Created by Shvier on 16/8/12.
//  Copyright © 2016年 Shvier. All rights reserved.
//

import UIKit

class DHSettingsViewController: UITableViewController {

    lazy var dataSource: [NSArray]? = {[]} ()
    lazy var cacheArray: [String]? = {[]} ()
    let kBackgroundViewHeight: CGFloat = 170
    
// MARK: - Data Handler
    func handleData() {
        dataSource = [["", "清空缓存"], ["提出BUG或改进", "去评分"], ["关注本项目源代码", "使用的库", "版本号"], ["关于"]]
    }
    
// MARK: - Life Cycle
    func initLifeCycle() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: kThemeColor]
        navigationItem.title = "掌刀"
    }
    
    func setContentView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kSettingCellReuseIdentifier)
        tableView.tableFooterView = UIView()
    }
    
    func getCacheSize() -> String {
        var folderSize: CGFloat = 0
        let cachePath: String = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        let files: [String] = FileManager.default.subpaths(atPath: cachePath)!
        for path in files {
            let filePath = cachePath + "/" + path
            cacheArray?.append(filePath)
            if FileManager.default.fileExists(atPath: filePath) {
                do {
                    let size: NSDictionary = try FileManager.default.attributesOfItem(atPath: filePath) as NSDictionary
                    folderSize += size["NSFileSize"] as! CGFloat
                } catch {
                    DHLog(error)
                }
                
            }
        }
        return String(format: "%.1fMB", folderSize/1024/1024)
    }
    
    func updateCacheCell() {
        tableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .fade)
    }
    
    func removeCache() {
        for path in cacheArray!{
            do {
                try FileManager.default.removeItem(atPath: path)
                DispatchQueue.main.async(execute: {
                    self.updateCacheCell()
                })
            } catch {
                
            }
        }
    }
    
    func getStringFromDataSource(indexPath: IndexPath) -> String {
        let array: NSArray = dataSource![indexPath.section]
        return array[indexPath.row] as! String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLifeCycle()
        setContentView()
        handleData()
    }
    
}

// MARK: - UITableViewDelegate
extension DHSettingsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return (dataSource?.count)!
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 20
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource![section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return kBackgroundViewHeight
        } else {
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
            case 0:
                if indexPath.row == 1 {
                    let cell = tableView.cellForRow(at: indexPath)
                    let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
                    indicator.startAnimating()
                    cell?.isUserInteractionEnabled = false
                    cell?.accessoryView = indicator
                    if getCacheSize() == "0.0MB" {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            indicator.stopAnimating()
                            self.updateCacheCell()
                        })
                    }
                    DispatchQueue.global().async(execute: {
                        self.removeCache()
                    })
                }
                break
            case 1:
                switch indexPath.row {
                    case 0:
                        UIApplication.shared.openURL(URL(string: "mailto:Shvier@icloud.com")!)
                        break
                    case 1:
                        // To AppStore
                        break
                    default:
                        break
                    }
                break
            case 2:
                switch indexPath.row {
                    case 0:
                        UIApplication.shared.openURL(URL(string: "https://github.com/Shvier/Dota2Helper")!)
                        break
                    case 1:
                        let sdkVC = DHSDKViewController()
                        navigationController?.pushViewController(sdkVC, animated: true)
                        break
                    default:
                        break
                }
            case 3:
                UIApplication.shared.openURL(URL(string: "https://github.com/Shvier/Dota2Helper/blob/master/README.md")!)
                break
            default:
                break
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kSettingCellReuseIdentifier, for: indexPath)
        switch indexPath.section {
            case 0:
                if indexPath.row == 0 {
                    let imageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kBackgroundViewHeight))
                    imageView.image = UIImage(named: "setting_background")
                    cell.isUserInteractionEnabled = false
                    cell.backgroundView = imageView
                } else if indexPath.row == 1 {
                    cell.textLabel?.text = getStringFromDataSource(indexPath: indexPath)
                    cell.isUserInteractionEnabled = true
                    let cacheLabel: UILabel = UILabel(frame: CGRect.zero)
                    cacheLabel.textAlignment = .right
                    let cache = getCacheSize()
                    let cacheLabelWidth = cache.sizeOfContent(font: UIFont(name: "Helvetica", size: 20)!).width
                    cacheLabel.frame = CGRect(x: kScreenWidth - cacheLabelWidth, y: 0, width: cacheLabelWidth, height: cell.bounds.size.height)
                    cacheLabel.text = cache
                    cell.accessoryView = cacheLabel
                }
                return cell
            case 2:
                cell.textLabel?.text = getStringFromDataSource(indexPath: indexPath)
                if indexPath.row == 0 {
                    let languageLabel: UILabel = UILabel(frame: CGRect.zero)
                    languageLabel.textAlignment = .right
                    let language = "Swift 3.0"
                    let languageLabelWidth = language.sizeOfContent(font: UIFont(name: "Helvetica", size: 20)!).width
                    languageLabel.frame = CGRect(x: kScreenWidth - languageLabelWidth, y: 0, width: languageLabelWidth, height: cell.bounds.size.height)
                    languageLabel.text = language
                    cell.accessoryView = languageLabel
                } else if indexPath.row == 2 {
                    let bundleLabel: UILabel = UILabel(frame: CGRect.zero)
                    bundleLabel.textAlignment = .right
                    let info: [String: Any] = Bundle.main.infoDictionary!
                    let version: String = info["CFBundleShortVersionString"] as! String
                    let build: String = info["CFBundleVersion"] as! String
                    let bundleInfo = "v " + version + " (" + "Build " + build + ")"
                    let bundleLabelWidth = bundleInfo.sizeOfContent(font: UIFont(name: "Helvetica", size: 20)!).width
                    bundleLabel.frame = CGRect(x: kScreenWidth - bundleLabelWidth, y: 0, width: bundleLabelWidth, height: cell.bounds.size.height)
                    bundleLabel.text = bundleInfo
                    cell.accessoryView = bundleLabel
                } else {
                    cell.accessoryType = .disclosureIndicator
                }
                return cell
            default:
                cell.textLabel?.text = getStringFromDataSource(indexPath: indexPath)
                cell.accessoryType = .disclosureIndicator
                return cell
        }
    }
}
