//
//  NewsNavigationController.swift
//  News
//
//  Created by Yang on 2019/10/23.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import SwiftTheme

class NewsNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bar = UINavigationBar.appearance()
        
        bar.theme_barTintColor = "colors.navigationBarTintColor"
        bar.theme_tintColor = "colors.navigationTintColor"
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            let backImage = NewsTheme.isNight() ? "lefterbackicon_titlebar_night_24x24_" : "lefterbackicon_titlebar_24x24_"
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: imageFromName(backImage), style: .plain, target: self, action: #selector(closeSelf))
           
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc private func closeSelf() {
        self.popViewController(animated: true)
    }
}
