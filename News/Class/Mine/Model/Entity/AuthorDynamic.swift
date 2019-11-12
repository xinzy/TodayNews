//
//  AuthorDynamic.swift
//  News
//  作者动态
//  Created by Yang on 2019/11/9.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation
import HandyJSON

struct DongtaiWrapper: HandyJSON {
    var max_cursor: UInt64 = 0
    var data = [Dongtai]()
    var has_more = false
}

struct Dongtai: HandyJSON {
    var id: UInt64 = 0
    
    var read_count = 0
    var create_time = 0
    var content = ""
    
    var item_type = 0
    var user = DongtaiUser()
    
    var comment_visible_count = 0 // 评论数
    var comment_type = 0
    
    var image_type = Dictionary<String, Int>()
    var thumb_image_list = [ImageItem]()
    var large_image_list = [ImageItem]()
    var ugc_cut_image_list = [ImageItem]()
    
    
    var avatar: String {
        return user.avatar_url
    }
    var name: String {
        return user.screen_name
    }
}

struct DongtaiUser {
    var avatar_url = ""
    var user_id: UInt64 = 0
    var screen_name = ""
    var description = ""
}
