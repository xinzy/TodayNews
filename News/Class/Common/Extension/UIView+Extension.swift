//
//  UIView.swift
//  Yingke
//
//  Created by Yang on 2019/10/16.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadable {
}

extension NibLoadable {
    static func loadViewFromNib() -> Self {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.first as! Self
    }
}

extension UIView {
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var tmp = frame
            tmp.size.width = newValue
            self.frame = tmp
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var tmp = frame
            tmp.size.height = newValue
            self.frame = tmp
        }
    }
    
    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var tmp = frame
            tmp.origin.x = newValue
            self.frame = tmp
        }
    }
    
    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var tmp = frame
            tmp.origin.y = newValue
            self.frame = tmp
        }
    }
    
    var right: CGFloat {
        get {
            return self.left + self.width
        }
    }
    
    var bottom: CGFloat {
        get {
            return self.top + self.height
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            var tmp = self.frame
            tmp.size = newValue
            self.frame = tmp
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            var tmp = self.center
            tmp.x = newValue
            self.center = tmp
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            var tmp = self.center
            tmp.y = newValue
            self.center = tmp
        }
    }

}
