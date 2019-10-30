//
//  FontSettingItem.swift
//  News
//
//  Created by Yang on 2019/10/28.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation

struct FontSettingItem {
    var title: String
    var value: Int
    
    init(title: String, value: Int) {
        self.title = title
        self.value = value
    }
    
    init(dict: [String : Any]) {
        self.title = dict["title"] as! String
        self.value = dict["value"] as! Int
    }
}
