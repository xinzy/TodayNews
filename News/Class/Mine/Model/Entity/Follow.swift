//
//  Follow.swift
//  News
//
//  Created by Yang on 2019/11/2.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation
import HandyJSON

struct Follow: HandyJSON {
    var created: Bool = false
    var description: String? = ""
    var user: FollowUser? = nil
}

struct FollowUser: HandyJSON {
    var avatar_url: String = ""
    var create_time: Int = 0   //1572079852
    var is_followed: Bool = false
    var is_following: Bool = false
    var last_update: String = "" //三叔，一个精准抓涨停板的男人！
    var media_id: UInt64 = 0
    var name = ""
    var screen_name = ""
    var type = 0
    var user_id: UInt64 = 0
    var user_verified = false
    var user_auth_info = ""
}
