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

    public func addSubviewAnimated(subview: UIView) {

        addSubview(subview)

        if bounds.size != subview.bounds.size {
            subview.transform(from: CGAffineTransformMakeScale(0.6, 0.6), to: CGAffineTransformIdentity, withDuration: 0.5)
        } else {
            subview.alpha(from: 0.0, to: 1.0, withDuration: 0.2)
        }
    }

    public func addSubview(subview: UIView, withTag tag: Int, animated: Bool = false) {

        subview.tag = tag

        if animated {
            addSubviewAnimated(subview)
        } else {
            addSubview(subview)
        }
    }

    // MARK: - Removal of subviews

    public func removeViewWithTag(tag: Int, animated: Bool = false) -> Bool {

        if let subview = viewWithTag(tag) {
            subview.removeFromSuperviewAnimated(animated)
            return true
        }

        return false
    }

}
