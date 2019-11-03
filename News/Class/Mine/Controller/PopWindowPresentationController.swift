//
//  PopWindowPresentationController.swift
//  News
//
//  Created by Yang on 2019/11/3.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

let DISMISS_NOTIFICATION = Notification.Name(rawValue: "DISMISS_NOTIFICATION")


class PopWindowPresentationController: UIPresentationController {

    var presentFrame: CGRect?
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        NotificationCenter.default.addObserver(self, selector: #selector(dismiss), name: DISMISS_NOTIFICATION, object: nil)
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        presentedView?.frame = presentFrame!
        let coverView = UIView(frame: mainBounds())
        coverView.backgroundColor = .clear
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        coverView.addGestureRecognizer(tap)
        
        self.containerView?.insertSubview(coverView, at: 0)
    }
    

    @objc private func dismiss() {
        self.presentedViewController.dismiss(animated: false, completion: nil)
    }
}
