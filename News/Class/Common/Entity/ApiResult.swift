//
//  ApiResult.swift
//  News
//
//  Created by Yang on 2019/10/25.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation
import HandyJSON

struct ApiResultList<T>: HandyJSON {
    var has_more: Bool = false
    var cursor: Int = 0
    var data: [T]? = nil
}

struct ApiResult<T>: HandyJSON {
    var data: T? = nil
    var message: String = ""
}

struct Content<R>: HandyJSON {
    var data: R? = nil
    var version: String = ""
}

struct ApiUserCard<T>: HandyJSON {
    var err_no = 0
    var has_more = 0
    var user_cards: [T]? = nil
}
