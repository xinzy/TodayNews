//
//  SettingItemCell.swift
//  News
//
//  Created by Yang on 2019/10/27.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import SwiftTheme

class SettingItemCell: UITableViewCell, CellRegister {
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var switcher: UISwitch!
    
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var subtitleConstraint: NSLayoutConstraint!
    
    var settingItem: SettingItem? = nil {
        didSet {
            guard let item = settingItem else { return }
            
            titleLabel.text = item.title
            subtitleLabel.text = item.subTitle
            rightLabel.text = item.rightText
            
            arrowImageView.isHidden = !item.isShowArrow
            switcher.isHidden = !item.isShowSwitcher
            
            subtitleConstraint.constant = item.subTitle == "" ? 0 : 20
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.theme_textColor = "colors.black"
        container.theme_backgroundColor = "colors.cellBackgroundColor"
        arrowImageView.theme_image = "images.mineRightArrow"
        separatorView.theme_backgroundColor = "colors.cellSeparatorColor"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
