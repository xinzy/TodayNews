//
//  BaseTableViewController.swift
//  News
//
//  Created by Yang on 2019/10/26.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import SwiftTheme

class BaseTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.theme_backgroundColor = "colors.main"
        
        self.tableView.separatorStyle = .none
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
