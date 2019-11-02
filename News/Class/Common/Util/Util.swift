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
        guard let window = UIApplication.shared.windows.first else {
            return false
        }
        return window.safeAreaInsets.bottom > 0
    }
    return false
}

func createViewControllerFromStoryboard<T>(_ name: T.Type, bundle: Bundle? = nil) -> T {
    let storyboard = UIStoryboard(name: String(describing: name.self), bundle: bundle)
    return storyboard.instantiateViewController(withIdentifier: String(describing: name.self)) as! T
}

func textHeight(_ text: String, fontSize: CGFloat, width: CGFloat) -> CGFloat {
    return (text as NSString).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [.font: UIFont.systemFont(ofSize: fontSize)], context: nil).size.height + 5
}
