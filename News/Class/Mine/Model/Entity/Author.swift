//
//  Author.swift
//  News
//  作者详情页面数据
//  Created by Yang on 2019/10/31.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation
import HandyJSON

/// 作者详情
struct AuthorInfo: HandyJSON {
    var is_followed: Bool = false
    var is_following: Bool = false
    var user_id: UInt64 = 0
    var area = ""
    var followers_count = 0  // 粉丝数 100
    var followings_count = 0 // 关注
    
    var followersCount: String {
        return followers_count > 10000 ? String(format: "%.1f 万", Float(followers_count) / 10000.0) : String(describing: followers_count)
    }
    
    var followingsCount: String {
        return followings_count > 10000 ? String(format: "%.1f 万", Float(followings_count) / 10000.0) : String(describing: followings_count)
    }
    
    var mplatform_followers_count = 0
    var name = "" // 齐俊杰
    var screen_name = "" // 齐俊杰
    var description = "" // 齐俊杰，资深媒体人，在新浪财经、凤凰财经、金评媒等专业化平台开有专栏。 干过电视，当过编导，报纸上码过字，杂志上写过稿，就喜欢在财经的地盘上叨逼叨，我只为真相带袋盐！
    var verified_content = "" // 财经专栏作家 投资人 优质财经领域创作者
    var big_avatar_url = "" // http://sf3-ttcdn-tos.pstatp.com/img/mosaic-legacy/1876/1968593421~120x256.image
    var avatar_url = "" // http://sf3-ttcdn-tos.pstatp.com/img/mosaic-legacy/1876/1968593421~120x256.image
    var bg_img_url = "" // http://p3.pstatp.com/origin/bc30011684fa86d4b71
    var gender = 0
    
    var current_user_id = 0
    var followers_detail = [Follower]()
    
    var top_tab = [TopTab]()
    var bottom_tab = [BottomTab]()
    var article_limit_enable = 0
    var verified_agency = "" // 头条认证
    var apply_auth_entry_title = "" // 我的认证
    var verified_content_v6 = "" // 认证：财经专栏作家 投资人 优质财经领域创作者
    var private_letter_permission = 0
    
    var pgc_like_count = 0
    var star_chart = [StarChart]()
    var user_verified = false // 认证
    
    var is_blocking = 0
    var user_decoration = ""
    var no_display_pgc_icon = 0
    var creator_id = 0
    var share_url = ""
    var show_private_letter = 0
    
    var media_type = 0
    var medals = [Medal]()
    var status = 0
    var media_id = 0
    var is_blocked = 0
    var user_auth_info = "" // {"auth_type":"1","auth_info":"财经专栏作家 投资人 优质财经领域创作者","other_auth":{"interest":"优质财经领域创作者"}}


    var descriptionHeight: CGFloat {
        return textHeight(description, fontSize: 13, width: screenWidth() - 30)
    }
    
    var hasBottom: Bool {
        return bottom_tab.count > 0
    }
    
//    required init() {}
}

/// 关注
struct Follower: HandyJSON {
    var fans_count = 0
    var apple_id = 0
    var name = ""
    var app_name = ""
    var download_url = ""
    var icon = ""
}

/// Top Tab
struct TopTab: HandyJSON {
    var url = ""
    var is_default = false
    var show_name = ""
    var type = ""
    var native_index_url = ""
}

/// Bottom Tab
struct BottomTab: HandyJSON {
    var type = ""
    var name = ""
    var value = ""
    var schema_href: String? = nil
    var raw_value: String? = nil
    
    var children: [BottomTab]? = nil
    
    func hasChild() -> Bool {
        if children == nil {
            return false
        }
        return children!.isNotEmpty
    }
}

struct StarChart: HandyJSON {
    
}

struct Medal: HandyJSON {
    
}
