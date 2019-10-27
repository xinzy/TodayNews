//
//  MoreLoginController.swift
//  News
//
//  Created by Yang on 2019/10/26.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import IBAnimatable
import SwiftTheme

class MoreLoginController: BaseAnimatableViewController {

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var topTipsLabel: UILabel!
    
    @IBOutlet weak var phoneContainer: AnimatableView!
    @IBOutlet weak var divideView: UIView!
    @IBOutlet weak var verfyCodeBtn: UIButton!
    
    @IBOutlet weak var loginReadBtn: UIButton!
    @IBOutlet weak var loginBtn: AnimatableButton!
    
    @IBOutlet weak var wechatLoginBtn: UIButton!
    @IBOutlet weak var tianyiLoginBtn: UIButton!
    @IBOutlet weak var emailLoginBtn: UIButton!
    @IBOutlet weak var qqLoginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        topTipsLabel.theme_textColor = "colors.black"
        verfyCodeBtn.theme_setTitleColor("colors.black", forState: .normal)
        loginBtn.theme_backgroundColor = "colors.loginBtnBackground"
        
        closeBtn.theme_setImage("images.loginCloseIcon", forState: .normal)
        wechatLoginBtn.theme_setImage("images.wechatLoginIcon", forState: .normal)
        qqLoginBtn.theme_setImage("images.qqLoginIcon", forState: .normal)
        emailLoginBtn.theme_setImage("images.emailLoginIcon", forState: .normal)
        tianyiLoginBtn.theme_setImage("images.tianyiLoginIcon", forState: .normal)
        
        loginReadBtn.theme_setImage("images.loginReadIcon", forState: .normal)
        loginReadBtn.theme_setImage("images.loginReadSelectedIcon", forState: .selected)
        
        loginReadBtn.isSelected = true
    }
    
    @IBAction func loginReadClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func closeButtonClick(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
