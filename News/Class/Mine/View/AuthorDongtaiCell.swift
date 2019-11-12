//
//  AuthorDongtaiCell.swift
//  News
//
//  Created by Yang on 2019/11/11.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import IBAnimatable
import Kingfisher

class AuthorDongtaiCell: UITableViewCell, CellRegister {

    @IBOutlet weak var avatarImageView: AnimatableImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var zanBtn: UIButton!
    @IBOutlet weak var zhuanBtn: UIButton!
    
    @IBOutlet weak var seperatorView: UIView!
    
    
    
    
    var dongtai: Dongtai? = nil {
        didSet {
            avatarImageView.kf.setImage(with: URL(string: dongtai!.avatar))
            nameLabel.text = dongtai!.name
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
