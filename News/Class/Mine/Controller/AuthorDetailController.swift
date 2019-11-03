//
//  AuthorDetailController.swift
//  News
//
//  Created by Yang on 2019/10/30.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

class AuthorDetailController: BaseAnimatableViewController {

    @IBOutlet weak var bottomSeperator: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomViewBottom: NSLayoutConstraint!
    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewTop: NSLayoutConstraint!
    
    var concern: ConcernItem!
    var authorInfo: AuthorInfo!
    
    private var changeStatusBarStyle: UIStatusBarStyle = .lightContent {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    private lazy var bottomTabView: AuthorDetailBottomBar = {
        let view = AuthorDetailBottomBar(frame: CGRect(x: 0, y: 0, width: self.bottomView.width, height: self.bottomView.height))
        view.delegate = self
        return view
    } ()
    
    private lazy var headerView: AuthorHeaderView = {
        let headerView = AuthorHeaderView.loadViewFromNib()
        return headerView
    } ()
    
    private lazy var customNavigationBar: AuthorDetailNavigationBar = {
        let bar = AuthorDetailNavigationBar.loadViewFromNib()
        return bar
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(customNavigationBar)
        scrollView.addSubview(headerView)
        scrollView.delegate = self
        
        scrollViewTop.constant = isFullScreen() ? -44 : -20
        bottomViewBottom.constant = isFullScreen() ? 34 : 0
        view.layoutIfNeeded()
        
        scrollView.contentSize = CGSize(width: screenWidth(), height: 1000)
        bottomSeperator.theme_backgroundColor = "colors.separatorColor"
        
        fetchDetail()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return changeStatusBarStyle
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - Delegate
extension AuthorDetailController : UIScrollViewDelegate, AuthorDetailBottomBarDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if offset < -44 {
            headerView.zoom(offset)
            self.customNavigationBar.alpha(0)
        } else {
            let alpha = min(1, (offset + 44) / 58)
            
            if alpha == 1.0 {
                changeStatusBarStyle = .default
            } else {
                changeStatusBarStyle = .lightContent
            }
            self.customNavigationBar.alpha(alpha)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return headerView.topBackgroundImageView
    }
    
    func authorDetailBottomBar(_ bar: AuthorDetailBottomBar, index: Int, button: UIButton, tab: BottomTab) {
        
        if tab.hasChild() { // 有子节点， 弹出pop
            let controller = AuthorDetailBottomTabPopController.loadViewControllerFromStoryboard()
            controller.bottomTabs = tab.children!
            controller.modalPresentationStyle = .custom
            controller.delegate = { tab in
                let webController = WebViewController()
                webController.url = tab.value
                webController.title = tab.name
                self.navigationController?.pushViewController(webController, animated: true)
            }
            let delegate = PopAnimationDelete()
            controller.transitioningDelegate = delegate
            
            let rect = bottomTabView.convert(button.frame, to: self.view)
            let x = rect.origin.x + 20
            let width = rect.width - 40
            let height = CGFloat(tab.children!.count) * 44 + 25
            let y = rect.origin.y - height
            let frame = CGRect(x: x, y: y, width: width, height: height)
            
            delegate.presentFrame = frame
            
            present(controller, animated: true, completion: nil)
        } else { // 显示网页
            let webController = WebViewController()
            webController.url = tab.value
            webController.title = tab.name
            self.navigationController?.pushViewController(webController, animated: true)
        }
    }
}

// MARK: - Http request
extension AuthorDetailController {
    
    private func fetchDetail() {
        getAuthorInfo(self.concern.userId, view: self.view) { info in
            self.authorInfo = info
            self.headerView.authorInfo = info
            
            if !info.hasBottom {
                self.bottomViewBottom.constant = 0
                self.bottomViewHeight.constant = 0
                self.view.layoutIfNeeded()
            } else {
                self.createBottomTab()
            }
        }
    }
    
    private func createBottomTab() {
        self.bottomView.addSubview(self.bottomTabView)
        self.bottomTabView.bottomTabs = self.authorInfo.bottom_tab
    }
}
