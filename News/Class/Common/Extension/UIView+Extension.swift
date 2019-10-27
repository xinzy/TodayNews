//
//  UIView.swift
//  Yingke
//
//  Created by Yang on 2019/10/16.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return left + width
        }
        set {
            left = newValue - width
        }
    }
    
    var bottom: CGFloat {
        get {
            return top + height
        }
        set {
            top = newValue - height
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.left = newValue - width / 2
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.top = newValue - height / 2
        }
    }
}
