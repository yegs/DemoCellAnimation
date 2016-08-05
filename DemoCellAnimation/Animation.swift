//
//  Animation.swift
//  DemoCellAnimation
//
//  Created by yeguoshuai on 16/8/5.
//  Copyright © 2016年 AK. All rights reserved.
//

import UIKit

class Animation: NSObject,UIViewControllerAnimatedTransitioning {

    var _transitionContext: UIViewControllerContextTransitioning!;


    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 5.25
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        _transitionContext = transitionContext;

        let fromVC = _transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as? ViewController

        let toVC: UIViewController! = _transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let containView: UIView! = _transitionContext.containerView()

        toVC.view.frame = UIScreen.mainScreen().bounds
        containView.addSubview(fromVC!.view)
        containView.addSubview(toVC.view)

        let backView: UIView = UIView.init(frame: UIScreen.mainScreen().bounds)
        backView.backgroundColor = UIColor.lightGrayColor()
        containView.addSubview(backView)

        let showView = (fromVC?.SelectedView)! as UIImageView
        let showViewFrame = showView.convertRect(showView.frame, toView: UIApplication.sharedApplication().keyWindow)

        let showImgView: UIImageView = UIImageView.init(frame: showViewFrame)
        showImgView.image = showView.image
        backView.addSubview(showImgView)

        UIView.animateWithDuration(self.transitionDuration(_transitionContext), animations: {

            () in
            var frame = showImgView.frame
            frame.origin.y = 64
            showImgView.frame = frame
            showView.alpha = 0.5

            }, completion: {

                (aniamtion) in

                showImgView.removeFromSuperview()
                backView.removeFromSuperview()
                self._transitionContext.completeTransition(true)

        })


    }


}
