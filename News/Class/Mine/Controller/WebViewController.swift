//
//  WebViewController.swift
//  News
//
//  Created by Yang on 2019/11/2.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: BaseViewController {

    var url: String = ""

    private lazy var webView: WKWebView = {
        let view = WKWebView(frame: self.view.bounds)
        return view
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(webView)
        self.webView.load(url: url)
    }
    
}
