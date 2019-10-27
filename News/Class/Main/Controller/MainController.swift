//
//  MainController.swift
//  News
//
//  Created by Yang on 2019/10/23.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit
import SwiftTheme

class MainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setValue(NewsTabBar(), forKey: "tabBar")
        self.tabBar.theme_barTintColor = "colors.tabBarTintColor"
        self.tabBar.theme_tintColor = "colors.tabTintColor"
        initTabs()
        
        NotificationCenter.default.addObserver(self, selector: #selector(themeChanged(_:)), name: notificationThemeChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func initTabs() {
        addController(HomeController(), "首页", "home")
        addController(VideoController(), "视频", "video")
        addController(TopicController(), "微头条", "weitoutiao")
        addController(MineController(), "我的", "mine")
    }
    
    private func addController(_ controller: UIViewController, _ title: String, _ image: String) {
        tabItemImage(controller, image)
        controller.title = title
        
        addChild(NewsNavigationController(rootViewController: controller))
    }
    
    private func tabItemImage(_ controller: UIViewController, _ name: String) {
        if (NewsTheme.isNight()) {
            setNightItemImage(controller, name)
        } else {
            setDayItemImage(controller, name)
        }
    }
    
    private func setDayItemImage(_ controller: UIViewController, _ name: String) {
        controller.tabBarItem.image = imageFromName("\(name)_tabbar_32x32_")
        controller.tabBarItem.selectedImage = imageFromName("\(name)_tabbar_press_32x32_")
    }
    
    private func setNightItemImage(_ controller: UIViewController, _ name: String) {
        controller.tabBarItem.image = imageFromName("\(name)_tabbar_night_32x32_")
        controller.tabBarItem.selectedImage = imageFromName("\(name)_tabbar_press_night_32x32_")
    }
    
    @objc private func themeChanged(_ notification: Notification) {
        let isNight = notification.object as? Bool ?? false
        if isNight {
            for controller in self.children {
                switch controller.title {
                case "首页":
                    setNightItemImage(controller, "home")
                case "视频":
                    setNightItemImage(controller, "video")
                case "微头条":
                    setNightItemImage(controller, "weitoutiao")
                case "我的":
                    setNightItemImage(controller, "mine")
                default:
                    break
                }
            }
        } else {
            for controller in self.children {
                switch controller.title {
                case "首页":
                    setDayItemImage(controller, "home")
                case "视频":
                    setDayItemImage(controller, "video")
                case "微头条":
                    setDayItemImage(controller, "weitoutiao")
                case "我的":
                    setDayItemImage(controller, "mine")
                default:
                    break
                }
            }
        }
    }
}
