//
//  AuthorDetailBottomTabPopController.swift
//  News
//
//  Created by Yang on 2019/11/3.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

class AuthorDetailBottomTabPopController: BaseViewController, StoryboardLoadable {
    
    var delegate: ((BottomTab) -> Void)? = nil
    
    var bottomTabs: [BottomTab] = [BottomTab]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.theme_backgroundColor = "colors.main"
        self.tableView.separatorStyle = .none
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
    }
}

extension AuthorDetailBottomTabPopController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bottomTabs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)", for: indexPath)
        cell.selectionStyle = .none
        
        let child = bottomTabs[indexPath.row]
        cell.textLabel?.text = child.name
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        
        cell.backgroundColor = .clear
        cell.textLabel?.theme_textColor = "colors.black"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tab = self.bottomTabs[indexPath.row]
        delegate?(tab)
        NotificationCenter.default.post(name: DISMISS_NOTIFICATION, object: nil)
    }
}
