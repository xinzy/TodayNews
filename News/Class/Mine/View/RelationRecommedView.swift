//
//  RelationRecommedView.swift
//  News
//
//  Created by Yang on 2019/11/3.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

/// 相关推荐View
class RelationRecommedView: UIView, NibLoadable {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var userCards: [UserCard]? {
        didSet {
            self.collectionView.reloadData()

            if let cards = self.userCards {
                var size = self.collectionView.contentSize
                size.width = CGFloat(162) * CGFloat(cards.count)
                self.collectionView.contentSize = size
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        titleLabel.theme_textColor = "colors.black"
        
        if #available(iOS 11.0, *) {
            self.collectionView.contentInsetAdjustmentBehavior = .never
        } else {
        }
        self.collectionView.collectionViewLayout = RelationRecommendLayout()
        self.collectionView.dataSource = self
        self.collectionView.xRegisterCell(cell: RelationRecommendCell.self)
        
    }
}

extension RelationRecommedView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userCards?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.xDequeueReusableCell(indexPath: indexPath) as RelationRecommendCell
        cell.userCard = self.userCards![indexPath.row]
        
        return cell
    }
}


class RelationRecommendLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        self.scrollDirection = .horizontal
        self.itemSize = CGSize(width: 142, height: 200)
        self.minimumLineSpacing = 10
        self.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
