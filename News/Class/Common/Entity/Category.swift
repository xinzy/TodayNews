//
//  Category.swift
//  News
//
//  Created by Yang on 2019/10/29.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation
import HandyJSON

struct Category : HandyJSON {
    
    var category: String = ""
    var name: String = ""
    var flags: Int = 0
    var icon_url: String = ""
    var web_url: String = ""
    var type: Int = 0
    var stick: Int = 0
    
    var isSelected: Bool = true
}
