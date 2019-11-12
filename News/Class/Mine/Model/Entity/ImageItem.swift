//
//  ImageItem.swift
//  News
//
//  Created by Yang on 2019/11/9.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation
import HandyJSON

struct ImageItem: HandyJSON {
    var width = 0
    var height = 0
    
    var image_type = 0
    var uri = ""
    
    var url_list = [ImageUrl]()
}

struct ImageUrl: HandyJSON {
    var url = ""
}
