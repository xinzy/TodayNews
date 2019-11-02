//
//  UITableView+Extension.swift
//  News
//
//  Created by Yang on 2019/10/24.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

extension UITableView {
    
    
    func xRegisterCell<T: UITableViewCell>(cell: T.Type) where T: CellRegister {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.identifier)
        } else {
            register(cell, forCellReuseIdentifier: T.identifier)
        }
    }
    
    func xDequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: CellRegister {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
    
    func reloadRowAt(_ at: IndexPath, with: UITableView.RowAnimation = .automatic) {
        self.reloadRows(at: [at], with: with)
    }
}
