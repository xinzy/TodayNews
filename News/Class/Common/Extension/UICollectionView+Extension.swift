//
//  UICollectionView+Extension.swift
//  News
//
//  Created by Yang on 2019/10/24.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    
    func xRegisterCell<T: UICollectionViewCell>(cell: T.Type) where T: CellRegister {
        if let nib = T.nib {
            register(nib, forCellWithReuseIdentifier: T.identifier)
        } else {
            register(cell, forCellWithReuseIdentifier: T.identifier)
        }
    }
    
    func xDequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: CellRegister {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
    
}
