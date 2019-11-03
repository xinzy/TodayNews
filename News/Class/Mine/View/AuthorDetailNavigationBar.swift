//
//  AuthorDetailNavigationBar.swift
//  News
//
//  Created by Yang on 2019/11/3.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

class AuthorDetailNavigationBar: UIView, NibLoadable {
    
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    func alpha(_ alpha: CGFloat) {
        backgroundColor = UIColor(white: 1, alpha: alpha)
        
        moreBtn.theme_setImage("images.author_nav_more_white", forState: .normal)
        if alpha < 1 {
            backBtn.theme_setImage("images.author_nav_back_white", forState: .normal)
        } else {
            backBtn.theme_setImage("images.author_nav_back_black", forState: .normal)
        }
    }
    
}
