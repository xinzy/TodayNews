//
//  PopAnimationDelegate.swift
//  News
//
//  Created by Yang on 2019/11/3.
//  Copyright © 2019 YangShaozeng. All rights reserved.
//

import UIKit

class PopAnimationDelete: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    var presentFrame: CGRect? = nil // 显示位置
    var isPresent = false // 记录当前是否已经打开
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentedController =  PopWindowPresentationController(presentedViewController: presented, presenting: presenting)
        
        presentedController.presentFrame = self.presentFrame
        
        return presentedController
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            let toView = transitionContext.view(forKey: .to)
            toView?.transform = CGAffineTransform(scaleX: 0, y: 0)
            transitionContext.containerView.addSubview(toView!)
            
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
                toView?.transform = .identity
            }) { _ in
                transitionContext.completeTransition(true)
            }
        } else {
            let fromView = transitionContext.view(forKey: .from)
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
                fromView?.transform = CGAffineTransform(scaleX: 0, y: 0)
            }) { _ in
                transitionContext.completeTransition(true)
            }
        }
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
         
        return self
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresent = true
        
        return self
    }
}
