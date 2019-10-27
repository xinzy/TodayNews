//
//  NewsTheme.swift
//  News
//
//  Created by Yang on 2019/10/25.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import SwiftTheme

let THEME_DEFAULT = "theme_default"
let THEME_NIGHT = "theme_night"

let THEME_KEY = "theme_is_night"

enum NewsTheme: Int {
    case day = 0, night
    
    static var current: NewsTheme = .day
    static var last: NewsTheme = .day
    
    static func isNight() -> Bool {
        return current == .night
    }
    
    static func switchTo(_ isNight: Bool) {
        last = current
        current = isNight ? .night : .day
        
        switch current {
        case .day:
            ThemeManager.setTheme(plistName: THEME_DEFAULT, path: .mainBundle)
        case .night:
            ThemeManager.setTheme(plistName: THEME_NIGHT, path: .mainBundle)
        }
    }
    
    static func saveTheme(_ isNight: Bool) {
        UserDefaults.standard.set(isNight, forKey: THEME_KEY)
    }
    
    static func setDefault() {
        switchTo(UserDefaults.standard.bool(forKey: THEME_KEY))
    }
}
