//
//  UIView+ActivityIndicator.swift
//  UIKitten
//
//  Created by Carsten Könemann on 23.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit

public extension UIView {

    public func addActivityIndicatorWithTag(tag: Int, indicatorStyle: UIActivityIndicatorViewStyle, blurEffectStyle: UIBlurEffectStyle, size: CGSize) -> UIView {

        // Spinner

        let spinner = UIActivityIndicatorView(activityIndicatorStyle: indicatorStyle)

        spinner.frame = CGRect(origin: CGPoint.zero, size: size)
        spinner.center = center
        spinner.startAnimating()

        // Blurred background

        let loadingOverlayView = UIVisualEffectView(frame: CGRect(origin: CGPoint.zero, size: size))

        loadingOverlayView.effect = UIBlurEffect(style: blurEffectStyle)

        if bounds.size != size {
            loadingOverlayView.layer.cornerRadius = 8
            loadingOverlayView.layer.masksToBounds = true
        }

        // Finish

        spinner.addSubview(loadingOverlayView)
        spinner.sendSubviewToBack(loadingOverlayView)

        addSubview(spinner, withTag: tag, animated: true)
        
        return spinner
    }

}
