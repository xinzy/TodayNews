//
//  NoLoginHeaderView.swift
//  News
//
//  Created by Yang on 2019/10/25.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import IBAnimatable
import SwiftTheme

class NoLoginHeaderView: UIView {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var phoneLoginBtn: UIButton!
    @IBOutlet weak var wechatLoginBtn: UIButton!
    @IBOutlet weak var qqLoginBtn: UIButton!
    @IBOutlet weak var sinaLoginBtn: UIButton!
    @IBOutlet weak var moreLoginBtn: AnimatableButton!
    
    @IBOutlet weak var favorBtn: UIButton!
    @IBOutlet weak var historyBtn: UIButton!
    @IBOutlet weak var modeBtn: UIButton!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var bottomView: UIView!
    
    class var headerViewHeight: CGFloat {
        return isFullScreen() ? 280 : 260
    }

    class func headerView() -> NoLoginHeaderView {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! NoLoginHeaderView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let effectX = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        effectX.maximumRelativeValue = 20
        effectX.minimumRelativeValue = -20
        stackView.addMotionEffect(effectX)
        phoneLoginBtn.theme_setImage("images.minePhoneLogin", forState: .normal)
        wechatLoginBtn.theme_setImage("images.mineWeichatLogin", forState: .normal)
        qqLoginBtn.theme_setImage("images.mineQQLogin", forState: .normal)
        sinaLoginBtn.theme_setImage("images.mineSinaLogin", forState: .normal)
        favorBtn.theme_setImage("images.mineFavor", forState: .normal)
        historyBtn.theme_setImage("images.mineHistory", forState: .normal)
        modeBtn.theme_setImage("images.mineTheme", forState: .normal)
        
        moreLoginBtn.theme_backgroundColor = "colors.moreLoginBackgroundColor"
        moreLoginBtn.theme_setTitleColor("colors.moreLoginTextColor", forState: .normal)
        favorBtn.theme_setTitleColor("colors.black", forState: .normal)
        modeBtn.theme_setTitleColor("colors.black", forState: .normal)
        historyBtn.theme_setTitleColor("colors.black", forState: .normal)
        bottomView.theme_backgroundColor = "colors.cellBackgroundColor"
        
        modeBtn.setTitle("夜间", for: .normal)
        modeBtn.setTitle("日间", for: .selected)
        
        modeBtn.isSelected = NewsTheme.isNight()
    }
    
    @IBAction func onThemeChange(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        NewsTheme.switchTo(sender.isSelected)
        NewsTheme.saveTheme(sender.isSelected)
        
        NotificationCenter.default.post(name: notificationThemeChange, object: sender.isSelected)
    }
    
    // TODO: -- iOS13上不放大
    func zoom(_ offset: CGFloat) {
        guard offset < 0 else { return }

        let totalHeight = NoLoginHeaderView.headerViewHeight + abs(offset)
        let percent = totalHeight / NoLoginHeaderView.headerViewHeight
        
        let frame = CGRect(x: -screenWidth() * (percent - 1), y: offset, width: screenWidth() * percent, height: totalHeight)
        self.backgroundImageView.frame = frame
    }
}
