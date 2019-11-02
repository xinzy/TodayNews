//
//  OfflineDownloadCell.swift
//  News
//
//  Created by Yang on 2019/10/29.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import SwiftTheme

class OfflineDownloadCell: UITableViewCell, CellRegister {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectedBtn: UIButton!
    @IBOutlet weak var separatorView: UIView!
    
    var category: Category? = nil {
        didSet {
            guard let cat = self.category else { return }
            titleLabel.text = cat.name
            selectedBtn.isSelected = cat.isSelected
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        container.theme_backgroundColor = "colors.cellBackgroundColor"
        titleLabel.theme_textColor = "colors.black"
        separatorView.theme_backgroundColor = "colors.cellSeparatorColor"
        selectedBtn.theme_setImage("images.offlineDownloadOptionSelected", forState: .selected)
        selectedBtn.theme_setImage("images.offlineDownloadOption", forState: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
