//
//  UIColor.swift
//  News
//
//  Created by Yang on 2019/10/23.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    convenience init(hex: UInt64, alpha: CGFloat = 1.0) {
        let r = (hex & 0xFF0000) >> 16
        let g = (hex & 0x00FF00) >> 8
        let b = (hex & 0x0000FF)
        
        self.init(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b), alpha: alpha)
    }
    
    class var systemColor: UIColor {
        return UIColor(r: 250, g: 250, b: 250)
    }
}
