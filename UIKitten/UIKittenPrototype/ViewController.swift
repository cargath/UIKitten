//
//  ViewController.swift
//  UIKittenPrototype
//
//  Created by Carsten Könemann on 21.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit
import UIKitten

public extension String {

    public static var loremIpsum: String {
        return "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    }

}

public extension UILabel {

    public convenience init(text: String, numberOfLines: Int = 0) {
        self.init(frame: .zero)
        self.text = text
        self.numberOfLines = numberOfLines
    }

}

class ViewController: UIViewController {

    let labelA = UILabel(text: "Lorem ipsum")
    let labelB = UILabel(text: "Lorem ipsum")
    let labelC = UILabel(text: "Lorem ipsum")

    var style: UIActivityIndicatorViewStyle = .WhiteLarge

    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.

        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .FastForward, target: self, action: #selector(ViewController.toggleFullActivityIndicator)),
            UIBarButtonItem(barButtonSystemItem: .Play, target: self, action: #selector(ViewController.toggleActivityIndicator))
        ]

        view.addSubview(labelA)
        view.addSubview(labelB)
        view.addSubview(labelC)

        labelA.translatesAutoresizingMaskIntoConstraints = false
        labelB.translatesAutoresizingMaskIntoConstraints = false
        labelC.translatesAutoresizingMaskIntoConstraints = false

        labelA.backgroundColor = .redColor()
        labelB.backgroundColor = .greenColor()
        labelC.backgroundColor = .blueColor()

        labelA.constraintsAlignTopInside(view, padding: 8).activate()
        labelB.constraintsAlignBelow(labelA, inside: view, horizontalPadding: 8, verticalPadding: 8).activate()
        labelC.constraintsAlignBelow(labelB, inside: view, horizontalPadding: 8, verticalPadding: 8).activate()
        //labelC.constraintsAlignBottomInside(view, below: labelB, horizontalPadding: 8, verticalPadding: 8).activate()
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
                labelA.textColor = .blackColor()
                labelB.textColor = .blackColor()
                labelC.textColor = .blackColor()
            case .Gray:
                view.backgroundColor = .blackColor()
                labelA.textColor = .whiteColor()
                labelB.textColor = .whiteColor()
                labelC.textColor = .whiteColor()
        }
        
        return self
    }

}
