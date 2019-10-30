//
//  SettingController.swift
//  News
//
//  Created by Yang on 2019/10/27.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import Kingfisher
import MBProgressHUD

class SettingController: BaseTableViewController {
    
    private var fontSettings = allFontSettings()

    private lazy var settings: [[SettingItem]] = {
        var data = [[SettingItem]]()
        let path = Bundle.main.path(forResource: "settings", ofType: "plist")
        let array = NSArray(contentsOfFile: path!) as! [Any]
        for item in array {
            let dicts = item as! [[String : Any]]
            
            var sections = [SettingItem]()
            for dict in dicts {
                let setting = SettingItem(dict: dict)
                sections.append(setting)
            }
            data.append(sections)
        }
        
        let fontSize = currentFontSize()
        for item in fontSettings {
            if item.value == fontSize {
                data[0][1].rightText = item.title
                break
            }
        }
        
        return data
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = .none
        self.tableView.estimatedRowHeight = 44
        self.tableView.xRegisterCell(cell: SettingItemCell.self)
        
        calculateCacheSize()
    }
}

// MARK: -- DataSource And Delegate
extension SettingController {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenHeight(), height: 10))
        view.theme_backgroundColor = "colors.separatorColor"
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settings[indexPath.section][indexPath.row]
        let cell = tableView.xDequeueReusableCell(indexPath: indexPath) as SettingItemCell
        
        cell.settingItem = setting
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0: //  清理缓存
                KingfisherManager.shared.cache.clearDiskCache {
                    self.clearCacheAlert()
                }
            case 1: // 修改字体
                showFontSettingAlert()
            case 3: // 下载图片网络设置
                showLoadImageNetworkTip()
            case 4: //网络情况提醒
                remindNetwork()
            default: break
            }
            
        case 1:
            switch indexPath.row {
            case 0:
                self.offlineDownload()
            default:break
            }
        default: break
        }
    }
}

// MARK: 逻辑处理
extension SettingController {
    
    /// 计算缓存大小
    private func calculateCacheSize() {
        KingfisherManager.shared.cache.calculateDiskStorageSize { (result) in
            switch result {
            case .success(let size):
                let sizeM = Double(size) / 1024.0 / 1024.0
                let sizeString = String(format: "%.2f M", sizeM)
                self.showCacheSize(sizeString)
            case .failure(_): break
            }
        }
    }
    
    /// 弹出清理缓存提示
    private func clearCacheAlert() {
        let alert = UIAlertController(title: "确定要清理缓存么?", message: nil, preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "确定", style: .default) { [weak self] (_) in
            if let view = self?.view {
                MBProgressHUD.showAdded(to: view, animated: true)
            }
            KingfisherManager.shared.cache.clearDiskCache {
                
                if let view = self?.view {
                    MBProgressHUD.hide(for: view, animated: true)
                }
                self?.showCacheSize("0.0M")
            }
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    /// 展示缓存大小
    private func showCacheSize(_ size: String?) {
        settings[0][0].rightText = size ?? "0.0 M"
        self.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    /// 显示设置字体l框
    private func showFontSettingAlert() {
        let alert = UIAlertController(title: "字体大小", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        
        for item in fontSettings {
            let action = UIAlertAction(title: item.title, style: .default) { [weak self] _ in
                saveFontSize(size: item.value)
                self?.settings[0][1].rightText = item.title
                self?.tableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .automatic)
            }
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
    
    /// 网络下载图片提醒
    private func showLoadImageNetworkTip() {
        let alertController = UIAlertController(title: "非Wi-Fi加载图片", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        
        for item in ["最佳效果(下载大图)", "智能下载(4G下载小图)"] {
            let action = UIAlertAction(title: item, style: .default) { [weak self] (_) in
                self?.settings[0][3].rightText = item
                self?.tableView.reloadRows(at: [IndexPath(row: 3, section: 0)], with: .automatic)
            }
            alertController.addAction(action)
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    /// 网络提醒方式
    private func remindNetwork() {
        let alertController = UIAlertController(title: "非Wi-Fi播放提醒", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        for title in ["每次提醒", "提醒一次"] {
            let action = UIAlertAction(title: title, style: .default) { [weak self] (_) in
                self?.settings[0][4].rightText = title
                self?.tableView.reloadRows(at: [IndexPath(row: 4, section: 0)], with: .automatic)
            }
            alertController.addAction(action)
        }
        present(alertController, animated: true, completion: nil)
    }
    
    /// 离线下载
    private func offlineDownload() {
        let controller = OfflineDownloadController()
        controller.title = "离线下载"
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
