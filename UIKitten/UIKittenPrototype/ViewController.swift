//
//  ViewController.swift
//  UIKittenPrototype
//
//  Created by Carsten Könemann on 21.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit
import UIKitten

class ViewController: UIViewController {

    let label = UILabel()

    var style: UIActivityIndicatorViewStyle = .WhiteLarge

    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.

        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .FastForward, target: self, action: #selector(ViewController.toggleFullActivityIndicator)),
            UIBarButtonItem(barButtonSystemItem: .Play, target: self, action: #selector(ViewController.toggleActivityIndicator))
        ]

        view.addSubview(label)

        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.numberOfLines = 0
    }

    override func viewDidLayoutSubviews() {
        label.frame = view.bounds
        //
        super.viewDidLayoutSubviews()
    }

    func toggleFullActivityIndicator() {
        if !view.removeViewWithTag(42, animated: true) {
            view.addActivityIndicatorWithTag(42, indicatorStyle: style, blurEffectStyle: .Light, size: CGSize(width: 64, height: 64))
        }
    }

    func toggleActivityIndicator() {
        if !view.removeViewWithTag(42, animated: true) {
            view.addActivityIndicatorWithTag(42, indicatorStyle: style, blurEffectStyle: .Light, size: view.bounds.size)
        }
    }

    func withActivityIndicatorViewStyle(style: UIActivityIndicatorViewStyle) -> ViewController {

        self.style = style

        switch style {
            case .WhiteLarge, .White:
                view.backgroundColor = .whiteColor()
                label.textColor = .blackColor()
            case .Gray:
                view.backgroundColor = .blackColor()
                label.textColor = .whiteColor()
        }
        
        return self
    }

}

