//
//  NewsTabBar.swift
//  News
//
//  Created by Yang on 2019/10/23.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

class NewsTabBar: UITabBar {
    
    private var publishButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(imageFromName("feed_publish_44x44_"), for: .normal)
        button.setImage(imageFromName("feed_publish_press_44x44_"), for: .selected)
        button.sizeToFit()
        return button
    } ()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(publishButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = frame.width
        let height = frame.height
        let itemWidth = width / 5
        
        var index = 0
        for item in subviews {
            if item == publishButton { continue }
            let count = index < 3 ? index - 1 : index
            let x = itemWidth * CGFloat(count)
            item.frame = CGRect(x: x, y: 0, width: itemWidth, height: height)
            
            index += 1
        }
        
        publishButton.center = CGPoint(x: width / 2, y: height / 2)
    }
}
