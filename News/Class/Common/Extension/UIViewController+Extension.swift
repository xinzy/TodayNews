//
//  UIViewController+Extension.swift
//  News
//
//  Created by Yang on 2019/11/3.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

protocol StoryboardLoadable {
}

extension StoryboardLoadable {
    static func loadViewControllerFromStoryboard(bundle: Bundle? = nil) -> Self {
        let storyboard = UIStoryboard(name: String(describing: "\(self)"), bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: String(describing: "\(self)")) as! Self
    }
}

extension UIViewController {
    
}
