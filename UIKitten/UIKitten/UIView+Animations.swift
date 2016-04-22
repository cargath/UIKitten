//
//  UIView+Animations.swift
//  UIKitten
//
//  Created by Carsten Könemann on 22.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import CoreGraphics
import UIKit

extension CGAffineTransform {

    private var xScale: CGFloat {
        return sqrt(a * a + c * c)
    }

    private var yScale: CGFloat {
        return sqrt(b * b + d * d)
    }
    
}

public extension UIView {

    // MARK: - Chaining animations

    public class func animateWithDuration(duration: NSTimeInterval, delay: NSTimeInterval, options: UIViewAnimationOptions, optionalAnimations: (() -> Void)?, completion: ((Bool) -> Void)?) {
        if let animations = optionalAnimations {
            animateWithDuration(duration, delay: delay, options: options, animations: animations, completion: completion)
        }
    }

    public class func chainAnimations(animations: [() -> Void], withTotalDuration duration: NSTimeInterval, completion: ((Bool) -> Void)? = nil) {
        chainAnimations(animations, withDuration: duration / Double(animations.count), completion: completion)
    }

    public class func chainAnimations(animations: [() -> Void], withDuration duration: NSTimeInterval, completion: ((Bool) -> Void)? = nil) {
        UIView.animateWithDuration(duration, delay: 0, options: [], optionalAnimations: animations.first, completion: { finished in
            if animations.count > 1 {
                self.chainAnimations(Array(animations.suffixFrom(1)), withDuration: duration, completion: completion)
            } else {
                completion?(true)
            }
        })
    }

    // MARK: - Animate transform

    public func transform(transform: CGAffineTransform, withDuration duration: NSTimeInterval, completion: ((Bool) -> Void)? = nil) {
        if transform.xScale < self.transform.xScale && transform.yScale < self.transform.yScale {
            UIView.animateWithDuration(duration, delay: 0, options: [], animations: {
                self.transform = transform
            }, completion: completion)
        } else {
            UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: CGFloat(duration) / 2.0, initialSpringVelocity: 1, options: [], animations: {
                self.transform = transform
            }, completion: completion)
        }
    }

    public func transform(from from: CGAffineTransform, to: CGAffineTransform, withDuration duration: NSTimeInterval, completion: ((Bool) -> Void)? = nil) {
        transform = from
        transform(to, withDuration: duration, completion: completion)
    }

    // MARK: - Animate alpha

    public func alpha(alpha: CGFloat, withDuration duration: NSTimeInterval, completion: ((Bool) -> Void)? = nil) {
        UIView.animateWithDuration(0.2, delay: 0, options: [], animations: {
            self.alpha = alpha
        }, completion: completion)
    }

    public func alpha(from from: CGFloat, to: CGFloat, withDuration duration: NSTimeInterval, completion: ((Bool) -> Void)? = nil) {
        alpha = from
        alpha(to, withDuration: duration, completion: completion)
    }

}
