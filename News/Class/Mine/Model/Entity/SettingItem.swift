//
//  SettingItem.swift
//  News
//
//  Created by Yang on 2019/10/27.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation

struct SettingItem {
    
    var title = ""
    var subTitle = ""
    var rightText = ""
    var isShowArrow = false
    var isShowSwitcher = false
    
    init(dict: [String : Any]) {
        self.title = dict["title"] as! String
        self.subTitle = dict["subtitle"] as! String
        self.rightText = dict["rightText"] as! String
        self.isShowArrow = dict["isShowArrow"] as! Bool
        self.isShowSwitcher = dict["isShowSwicher"] as! Bool
    }
}
