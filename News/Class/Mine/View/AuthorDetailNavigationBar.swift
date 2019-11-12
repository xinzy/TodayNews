//
//  AuthorDetailNavigationBar.swift
//  News
//
//  Created by Yang on 2019/11/3.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

protocol AuthorDetailNavigationBarDelegate : class {
    func authorDetailNavigationBar(_ bar: AuthorDetailNavigationBar)
}

class AuthorDetailNavigationBar: UIView, NibLoadable {
    
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate: AuthorDetailNavigationBarDelegate?
    
    var authorName: String = "" {
        didSet {
            self.titleLabel.text = self.authorName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        theme_backgroundColor = "colors.navigationBarTintColor"
        titleLabel.theme_textColor = "colors.navigationTintColor"
    }
    
    @IBAction func onBackClick(_ sender: UIButton) {
        delegate?.authorDetailNavigationBar(self)
    }
    
    func alpha(_ alpha: CGFloat) {
//        backgroundColor = UIColor(white: 1, alpha: alpha)
        titleLabel.alpha = alpha
        self.alpha = alpha
        
        moreBtn.theme_setImage("images.author_nav_more_white", forState: .normal)
        if alpha < 1 {
            backBtn.theme_setImage("images.author_nav_back_white", forState: .normal)
        } else {
            backBtn.theme_setImage("images.author_nav_back_black", forState: .normal)
        }
    }
    
}
