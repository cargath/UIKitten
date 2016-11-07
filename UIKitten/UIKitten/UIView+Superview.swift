//
//  UIView+Superview.swift
//  UIKitten
//
//  Created by Carsten Könemann on 23.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit

public extension UIView {

    // MARK: - Removal from superviews

    public func dismiss() {
        UIView.animate(withDuration: 0.15, delay: 0, options: [], animations: {
            self.alpha = 0.1
            self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: { finished in
            self.removeFromSuperview()
        })
    }

    public func fadeOut() {
        alpha(0.0, withDuration: 0.1, completion: { finished in
            self.removeFromSuperview()
        })
    }

    public func removeFromSuperviewAnimated() {

        guard let superview = self.superview else {
            return
        }

        if bounds.size != superview.bounds.size {
            dismiss()
        } else {
            fadeOut()
        }
    }

    public func removeFromSuperviewAnimated(_ animated: Bool) {

        if animated {
            removeFromSuperviewAnimated()
        } else {
            removeFromSuperview()
        }
    }

}
