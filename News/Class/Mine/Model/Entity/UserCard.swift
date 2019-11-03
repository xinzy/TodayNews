//
//  UserCard.swift
//  News
//
//  Created by Yang on 2019/11/3.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation
import HandyJSON

struct UserCard: HandyJSON {
    var user: User = User()
    var recommend_reason = ""
    var recommend_type = 0
    var intro = ""
    var show_name = ""
    var description = ""
    var profile_user_id: UInt64 = 0
    var card_type = 0
    
    var avatar: String {
        return user.info.avatar_url
    }
    
    var username: String {
        return user.info.name
    }
    
    var desc: String {
        return user.info.desc
    }
    
    var userId: UInt64 {
        return user.info.user_id
    }
}

struct User: HandyJSON {
    var info: Info = Info()
    var relation: Relation?
    var relation_count: RelationCount?
}

struct Info: HandyJSON {
    var avatar_url = ""
    var desc = ""
    var name = ""
    var schema = ""
    var user_auth_info = ""
    var verified_content = ""
    var user_id: UInt64 = 0
    var user_verified = 0
}

struct Relation: HandyJSON {
    var is_followed = 0
    var is_following = 0
    var is_friend = 0
}

struct RelationCount: HandyJSON {
    var followings_count = 0
    var followers_count = 0
}
