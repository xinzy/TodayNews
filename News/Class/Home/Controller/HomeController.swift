//
//  HomeController.swift
//  News
//
//  Created by Yang on 2019/10/23.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    var mainView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.frame = CGRect(x: 0, y: 300, width: screenWidth(), height: 200)
        mainView.contentMode = .scaleAspectFill
        mainView.backgroundColor = .red
        mainView.image = imageFromName("wallpaper_profile_night")
        
        self.view.addSubview(mainView)
        
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 50, y: 500, width: 75, height: 24)
        btn.setTitle("测试", for: .normal)
        btn.addTarget(self, action: #selector(onClick(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    var count: CGFloat = 0

    @objc func onClick(_ sender: UIButton) {
        let x = mainView.frame.origin.x
        let y = mainView.frame.origin.y
        let width = mainView.frame.width
        let height = mainView.frame.height
        
        mainView.frame = CGRect(x: x - count * 10, y: y - count * 10, width: width + count * 20, height: height + count * 20)
        count += 1
    }
}
