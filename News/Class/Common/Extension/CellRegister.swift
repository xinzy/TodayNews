//
//  CellRegister.swift
//  News
//
//  Created by Yang on 2019/10/24.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

protocol CellRegister {
}

extension CellRegister {
    static var identifier: String {
        return "\(self)"
    }
    
    static var nib: UINib? {
        return UINib(nibName: "\(self)", bundle: nil)
    }
}
