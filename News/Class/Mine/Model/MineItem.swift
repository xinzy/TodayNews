//
//  MineItem.swift
//  News
//
//  Created by Yang on 2019/10/24.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation
import HandyJSON

struct MineItem {
    var title: String = ""
    var url: String = ""
}

struct ConcernItem: HandyJSON {
    var user_id: UInt64 = 0
    var is_verified = 0
    var name = ""
    var icon = ""
    var description = ""
    
    var userId: UInt64 {
        return user_id
    }
    
    var isVip: Bool {
        return is_verified == 1
    }
}
