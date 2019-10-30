//
//  Settings.swift
//  News
//
//  Created by Yang on 2019/10/28.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

let KEY_FONT = "key-font"

/// 当前设置的 Font Size
func currentFontSize() -> Int {
    let size = UserDefaults.standard.integer(forKey: KEY_FONT)
    return size == 0 ? 15 : size
}

func saveFontSize(size: Int) {
    UserDefaults.standard.set(size, forKey: KEY_FONT)
}






/// 获取所有的字体设置项
func allFontSettings() -> [FontSettingItem] {
    var settings = [FontSettingItem]()
    let path = Bundle.main.path(forResource: "fontSizeSetting", ofType: "plist")
    let array = NSArray(contentsOfFile: path!) as! [Any]

    for item in array {
       let dict = item as! [String : Any]
       let setting = FontSettingItem(dict: dict)
       settings.append(setting)
    }
    return settings
}
