//
//  SettingController.swift
//  News
//
//  Created by Yang on 2019/10/27.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

class SettingController: BaseTableViewController {

    private var settings: [[SettingItem]] = {
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
        return data
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.estimatedRowHeight = 44
        self.tableView.xRegisterCell(cell: SettingItemCell.self)
    }
}

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
    }
}
