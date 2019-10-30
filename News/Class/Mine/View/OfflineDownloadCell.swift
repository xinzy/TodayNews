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
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var separatorView: UIView!
    
    var category: Category? = nil {
        didSet {
            guard let cat = self.category else { return }
            titleLabel.text = cat.name
            selectedImageView.theme_image = cat.isSelected ? "images.offlineDownloadOptionSelected" : "images.offlineDownloadOption"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        container.theme_backgroundColor = "colors.cellBackgroundColor"
        titleLabel.theme_textColor = "colors.black"
        separatorView.theme_backgroundColor = "colors.cellSeparatorColor"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
