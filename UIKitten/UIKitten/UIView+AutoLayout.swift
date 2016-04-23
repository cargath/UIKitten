//
//  UIView+AutoLayout.swift
//  UIKitten
//
//  Created by Carsten Könemann on 23.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit

// MARK: - Activate / deactivate multiple constraints

public extension Array where Element: NSLayoutConstraint {

    @available(iOS 8.0, *)
    public func activate() {
        for constraint in self {
            constraint.active = true
        }
    }

    @available(iOS 8.0, *)
    public func deactivate() {
        for constraint in self {
            constraint.active = false
        }
    }
    
}

// MARK: - Generate multiple constraints

public extension UIView {

    @available(iOS 9.0, *)
    public func constraintsEqualToEdges(view: UIView) -> [NSLayoutConstraint] {
        return [
            topAnchor.constraintEqualToAnchor(view.topAnchor),
            leftAnchor.constraintEqualToAnchor(view.leftAnchor),
            rightAnchor.constraintEqualToAnchor(view.rightAnchor),
            bottomAnchor.constraintEqualToAnchor(view.bottomAnchor)
        ]
    }

}
