//
//  OfflineDownloadController.swift
//  News
//
//  Created by Yang on 2019/10/29.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import SnapKit

class OfflineDownloadController: BaseTableViewController {
    
    private var categories = [Category]()
    
    private let database = NewsDatabase()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = 44
        self.tableView.xRegisterCell(cell: OfflineDownloadCell.self)
        
        let cats = database.listAll()
        if cats.isEmpty {
            httpGet(apiCategory, type: ApiResult<Content<Array<Category>>>.self, view: self.view, success: { [weak self] (result) in
                if let cats = result?.data?.data {
                    self?.categories = cats
                    self?.tableView.reloadData()
                    
                    self?.database.insert(cats)
                }
            } )
        } else {
            self.categories = cats
            self.tableView.reloadData()
        }
    }
}

// MARK: - Table view data source
extension OfflineDownloadController {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth(), height: 44))
        view.theme_backgroundColor = "colors.cellBackgroundColor"
        let label = UILabel()
        label.text = "我的订阅"
        label.sizeToFit()
        label.theme_textColor = "colors.black"
        view.addSubview(label)
        
        let separator = UIView()
        separator.theme_backgroundColor = "colors.cellSeparatorColor"
        view.addSubview(separator)
        
        label.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        separator.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = self.categories[indexPath.row]
        let cell = tableView.xDequeueReusableCell(indexPath: indexPath) as OfflineDownloadCell
        cell.category = category

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cat = self.categories[indexPath.row]
        let selected = !self.categories[indexPath.row].isSelected
        self.categories[indexPath.row].isSelected = selected
        tableView.reloadRowAt(indexPath)
//        tableView.deselectRow(at: indexPath, animated: true)
        
        self.database.setSelected(cat.category, selected: selected)
    }
}
