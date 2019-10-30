//
//  Http.swift
//  News
//
//  Created by Yang on 2019/10/25.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import HandyJSON

func get<T: HandyJSON>(_ url: String, type: T.Type, view: UIView? = nil, success: ((T?) -> Void)? = nil, error: ((Error?) -> Void)? = nil) {
    
    if view != nil {
        MBProgressHUD.showAdded(to: view!, animated: true)
    }
    AF.request(url).responseString { (response) in
        if view != nil {
            MBProgressHUD.hide(for: view!, animated: true)
        }
        if let e = response.error {
            error?(e)
            return
        }
        if let content = response.value {
            debugPrint(content)
            let result = T.deserialize(from: content)
            success?(result)
        } else {
            error?(nil)
        }
    }
}
