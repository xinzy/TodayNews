//
//  WebView+Extension.swift
//  News
//
//  Created by Yang on 2019/11/2.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation
import WebKit

extension WKWebView {
    
    
    func load(url: String) {
        if let uri = URL(string: url) {
            self.load(URLRequest(url: uri))
        }
    }
    
    
}
