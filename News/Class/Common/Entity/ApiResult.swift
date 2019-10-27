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

