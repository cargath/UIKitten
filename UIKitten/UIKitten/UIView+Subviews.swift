//
//  UIView+Subviews.swift
//  UIKitten
//
//  Created by Carsten Könemann on 23.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit

public extension UIView {

    // MARK: - Adding subviews

    public func addSubviewAnimated(_ subview: UIView) {

        addSubview(subview)

        if bounds.size != subview.bounds.size {
            subview.transform(from: CGAffineTransform(scaleX: 0.6, y: 0.6), to: CGAffineTransform.identity, withDuration: 0.5)
        } else {
            subview.alpha(from: 0.0, to: 1.0, withDuration: 0.2)
        }
    }

    public func addSubview(_ subview: UIView, withTag tag: Int, animated: Bool = false) {

        subview.tag = tag

        if animated {
            addSubviewAnimated(subview)
        } else {
            addSubview(subview)
        }
    }

    // MARK: - Removal of subviews

    public func removeViewWithTag(_ tag: Int, animated: Bool = false) -> Bool {

        if let subview = viewWithTag(tag) {
            subview.removeFromSuperviewAnimated(animated)
            return true
        }

        return false
    }

    // MARK: - Enumerating subviews

    public func enumerateSubviewsUsingBlock(_ block: (UIView) -> Void) {

        for subview in subviews {

            // Perform operation on subview
            block(subview)

            // Perform operation on all subviews of subview
            subview.enumerateSubviewsUsingBlock(block)
        }
    }

}
