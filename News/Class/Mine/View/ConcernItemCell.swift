//
//  ConcernItemCell.swift
//  News
//
//  Created by Yang on 2019/10/25.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import Kingfisher

class ConcernItemCell: UICollectionViewCell, CellRegister {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var vipImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var concern: ConcernItem? {
        didSet {
            guard let item = self.concern else { return }
            titleLabel.text = item.name
            vipImageView.isHidden = !item.isVip
            avatarImageView.kf.setImage(with: URL(string: item.icon))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.theme_textColor = "colors.black"
    }

}
