//
//  MineItemCell.swift
//  News
//
//  Created by Yang on 2019/10/24.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import SwiftTheme

class MineItemCell: UITableViewCell, CellRegister {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var separatorView: UIView!
    
    
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
    
    func setItem(item: MineItem) {
        titleLabel.text = item.title
    }
}
