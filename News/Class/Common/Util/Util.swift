//
//  Util.swift
//  Yingke
//
//  Created by Yang on 2019/10/15.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation
import UIKit

func mainBounds() -> CGRect {
    return UIScreen.main.bounds
}

func screenWidth() -> CGFloat {
    return mainBounds().width
}

func screenHeight() -> CGFloat {
    return mainBounds().height
}

func fontOfSize(_ size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size)
}

func imageFromName(_ name: String) -> UIImage? {
    return UIImage(named: name)
}

func isFullScreen() -> Bool {
    if #available(iOS 11, *) {
        guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
          return false
        }

        if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
          print(unwrapedWindow.safeAreaInsets)
          return true
        }
    }
    return false
}

func createViewControllerFromStoryboard<T>(_ name: T.Type, bundle: Bundle? = nil) -> T {
    let storyboard = UIStoryboard(name: String(describing: name.self), bundle: bundle)
    return storyboard.instantiateViewController(withIdentifier: String(describing: name.self)) as! T
}
