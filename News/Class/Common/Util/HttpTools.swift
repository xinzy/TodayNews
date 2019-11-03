//
//  Request.swift
//  News
//
//  Created by Yang on 2019/10/31.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit


/// 获取用户详细信息
func getAuthorInfo(_ userId: UInt64, view: UIView? = nil, block: @escaping (AuthorInfo) -> Void) {
    let url = String(format: apiAuthorDetail, userId)
    httpGet(url, type: ApiResult<AuthorInfo>.self, view: view, success: { result in
        guard let info = result?.data else { return }
        block(info)
    })
}

/// 关注用户
func followAuthor(_ userId: UInt64, view: UIView? = nil, block: @escaping (Follow) -> Void) {
    let url = String(format: apiFollow, userId)
    httpGet(url, type: ApiResult<Follow>.self, view: view, success: { result in
        guard let data = result?.data else { return }
        block(data)
    })
}

/// 取消关注
func unfollowAuthor(_ userId: UInt64, view: UIView? = nil, block: @escaping (Follow) -> Void) {
    let url = String(format: apiUnfollow, userId)
    httpGet(url, type: ApiResult<Follow>.self, view: view, success: { result in
        guard let data = result?.data else { return }
        block(data)
    })
}

/// 推荐关注
func recommendFollow(_ userid: UInt64, view: UIView? = nil, block: @escaping ([UserCard]) -> Void) {
    let url = String(format: apiFollowRecommend, userid)
    httpGet(url, type: ApiUserCard<UserCard>.self, view: view, success: { result in
        guard let data = result?.user_cards else { return }
        block(data)
    })
}
