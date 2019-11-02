//
//  ConcernCell.swift
//  News
//
//  Created by Yang on 2019/10/24.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import Kingfisher

protocol ConcernCellDelegate : class {
    func concernCell(_ concernCell: ConcernCell, concern: ConcernItem)
}

class ConcernCell: UITableViewCell, CellRegister {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var concernImageView: UIImageView!
    @IBOutlet weak var concernCollectionView: UICollectionView!
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var separatorView: UIView!
    
    weak var delegate: ConcernCellDelegate? = nil
    
    // 我的关注列表
    var concerns: [ConcernItem]? = nil {
        didSet {
           if let cs = concerns {
               if cs.count == 0 {
                   concernImageView.isHidden = true
                   concernCollectionView.isHidden = true
               } else if cs.count == 1 {
                   concernImageView.isHidden = false
                   concernCollectionView.isHidden = true
                   
                   let url = cs.first!.icon
                   concernImageView.kf.setImage(with: URL(string: url))
               } else {
                   concernImageView.isHidden = true
                   concernCollectionView.isHidden = false
                   // TODO: 多个关注
               }
           } else {
               concernImageView.isHidden = true
               concernCollectionView.isHidden = true
           }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        concernCollectionView.collectionViewLayout = ConcernLayout()
        concernCollectionView.xRegisterCell(cell: ConcernItemCell.self)
        concernCollectionView.dataSource = self
        concernCollectionView.delegate = self
        
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

extension ConcernCell : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return concerns == nil ? 0 : concerns!.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.xDequeueReusableCell(indexPath: indexPath) as ConcernItemCell
        cell.concern = self.concerns![indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let concern = self.concerns![indexPath.row]
        self.delegate?.concernCell(self, concern: concern)
    }
}

class ConcernLayout: UICollectionViewFlowLayout {
    override func prepare() {
        itemSize = CGSize(width: 56, height: 56)
        minimumLineSpacing = 12
        minimumInteritemSpacing = 0
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        scrollDirection = .horizontal
    }
}
