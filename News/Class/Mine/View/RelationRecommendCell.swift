//
//  RelationRecommendCell.swift
//  News
//
//  Created by Yang on 2019/11/3.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import IBAnimatable
import Kingfisher

class RelationRecommendCell: UICollectionViewCell, CellRegister {
    @IBOutlet weak var avatarImageView: AnimatableImageView!
    @IBOutlet weak var vImageView: UIImageView!
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followBtn: AnimatableButton!
    
    @IBOutlet weak var loadingView: UIImageView!
    
    var userCard: UserCard! {
        didSet {
            avatarImageView.kf.setImage(with: URL(string: self.userCard.avatar))
            nameLabel.text = self.userCard.username
            infoLabel.text = self.userCard.desc
        }
    }
    
    private lazy var loadingAnimation: CABasicAnimation = {
        let anim = CABasicAnimation(keyPath: "transform.rotation.z")
        anim.fromValue = 0
        anim.toValue = Double.pi * 2
        anim.duration = 1.5
        anim.autoreverses = false
        anim.repeatCount = MAXFLOAT
        
        return anim
    } ()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        infoLabel.theme_textColor = "colors.black"
        nameLabel.theme_textColor = "colors.black"
    }

    @IBAction func onFollowClick(_ sender: AnimatableButton) {

        self.loadingView.isHidden = false
        self.loadingView.layer.add(loadingAnimation, forKey: nil)
        if sender.isSelected { // 已关注，点击取消
            
            unfollowAuthor(self.userCard.userId) { (_) in
                sender.backgroundColor = .red
                sender.isSelected = false
                sender.setTitle("关注", for: .normal)
                
                self.loadingView.layer.removeAllAnimations()
                self.loadingView.isHidden = true
            }
        } else { // 未关注， 点击取消
            
            followAuthor(self.userCard.userId) { (_) in
                sender.backgroundColor = .gray
                sender.isSelected = true
                sender.setTitle("已关注", for: .normal)
                
                self.loadingView.layer.removeAllAnimations()
                self.loadingView.isHidden = true
            }
        }
    }
}
