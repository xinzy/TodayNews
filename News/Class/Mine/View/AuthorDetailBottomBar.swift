//
//  AuthorDetailBottomBar.swift
//  News
//
//  Created by Yang on 2019/11/2.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

protocol AuthorDetailBottomBarDelegate : class {
    func authorDetailBottomBar(_ bar: AuthorDetailBottomBar, index: Int, button: UIButton, tab: BottomTab)
}

class AuthorDetailBottomBar: UIView {
    
    weak var delegate: AuthorDetailBottomBarDelegate? = nil
    
    var bottomTabs = [BottomTab]() {
        didSet {
            let itemWidth = self.width / CGFloat(bottomTabs.count)
            
            for (index, item) in bottomTabs.enumerated() {
                let btn = UIButton(frame: CGRect(x: itemWidth * CGFloat(index), y: 0, width: itemWidth, height: self.height))
                btn.setTitle(item.name, for: .normal)
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                btn.theme_setTitleColor("colors.black", forState: .normal)
                btn.theme_setImage("images.author_tabbar_option", forState: .normal)
                btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0)
                btn.tag = index
                
                btn.addTarget(self, action: #selector(onItemBtnClick(_:)), for: .touchUpInside)
                self.addSubview(btn)
            }
            for index in 1..<self.bottomTabs.count {
                let view = UIView(frame: CGRect(x: itemWidth * CGFloat(index), y: 8, width: 0.5, height: self.height - 16))
                view.theme_backgroundColor = "colors.separatorColor"
                self.addSubview(view)
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    @objc private func onItemBtnClick(_ btn: UIButton) {
        print("fuck")
        let tab = self.bottomTabs[btn.tag]
        self.delegate?.authorDetailBottomBar(self, index: btn.tag, button: btn, tab: tab)
    }
    
    private func createTabs() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
