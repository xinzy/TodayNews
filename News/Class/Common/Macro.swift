//
//  Macro.swift
//  News
//
//  Created by Yang on 2019/10/24.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation

let baseUrl = "https://lf.snssdk.com"
let baseUrl2 = "https://lg.snssdk.com"

let iid = "37735925461"
let appName = "news_article"

let osVersion = "11.3"

let aid = 13

let platform = "iphone"

let idfa = "49295A2B-F4D5-4B34-834A-F63B69EDE7FA"
let idfv = "200F6D21-1BF8-4046-A062-3133141F8BEA"
let version = "6.8.0"
let deviceId = "51367418639"


/******************************************************************/
///我的
/******************************************************************/

/// 我的关注
let apiConcern = "\(baseUrl)/concern/v2/follow/list/v2/?app_name=\(appName)&aid=\(aid)&idfv=\(idfv)&os_version=\(osVersion)&device_platform=\(platform)&iid=\(iid)&idfa=\(idfa)"

/// 分类
let apiCategory = "\(baseUrl2)/article/category/get_subscribed/v4/?app_name=\(appName)&aid=\(aid)&idfv=\(idfv)&os_version=\(osVersion)&device_platform=\(platform)&iid=\(iid)&idfa=\(idfa)"

/// 作者信息
let apiAuthorDetail = "\(baseUrl)/user/profile/homepage/v6/?app_name=\(appName)&aid=\(aid)&idfv=\(idfv)&os_version=\(osVersion)&device_platform=\(platform)&iid=\(iid)&idfa=\(idfa)&user_id=%ld"

/// 关注
let apiFollow = "\(baseUrl)/2/relation/follow/v2/?app_name=\(appName)&aid=\(aid)&idfv=\(idfv)&os_version=\(osVersion)&device_platform=\(platform)&iid=\(iid)&idfa=\(idfa)&user_id=%ld"

/// 取消关注
let apiUnfollow = "\(baseUrl)/2/relation/unfollow/?app_name=\(appName)&aid=\(aid)&idfv=\(idfv)&os_version=\(osVersion)&device_platform=\(platform)&iid=\(iid)&idfa=\(idfa)&user_id=%ld"

/// 推荐关注
let apiFollowRecommend = "\(baseUrl)/user/relation/user_recommend/v1/supplement_recommends/?iid=\(iid)&idfa=\(idfa)&idfv=\(idfv)&follow_user_id=%ld"

/// 作者动态
let apiAuthorDongtai = "\(baseUrl)/dongtai/list/v21/?current_type=dongtai&user_id=%ld&app_name=\(appName)&aid=\(aid)&idfv=\(idfv)&os_version=\(osVersion)&device_platform=\(platform)&iid=\(iid)&idfa=\(idfa)&device_id=\(deviceId)"
