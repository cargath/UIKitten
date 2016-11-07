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
            constraint.isActive = true
        }
    }

    @available(iOS 8.0, *)
    public func deactivate() {
        for constraint in self {
            constraint.isActive = false
        }
    }
    
}

// MARK: - Generate multiple constraints

public extension UIView {

    // MARK: Center fill

    @available(iOS 9.0, *)
    public func constraintsEqualToEdges(_ containerView: UIView, horizontalPadding: CGFloat = 0, verticalPadding: CGFloat = 0) -> [NSLayoutConstraint] {
        return [
            topAnchor.constraint(equalTo: containerView.topAnchor, constant: verticalPadding),
            leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: horizontalPadding),
            rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -horizontalPadding),
            bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -verticalPadding)
        ]
    }

    // MARK: Stack vertically

    @available(iOS 9.0, *)
    public func constraintsAlignTopInside(_ containerView: UIView, above view: UIView? = nil, horizontalPadding: CGFloat = 0, verticalPadding: CGFloat = 0) -> [NSLayoutConstraint] {

        var constraints: [NSLayoutConstraint] = [
            topAnchor.constraint(equalTo: containerView.topAnchor, constant: verticalPadding),
            leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: horizontalPadding),
            rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -horizontalPadding)
        ]

        if let view = view {
            constraints.append(bottomAnchor.constraint(equalTo: view.topAnchor, constant: -verticalPadding))
        }

        return constraints
    }

    @available(iOS 9.0, *)
    public func constraintsAlignTopInside(_ containerView: UIView, above view: UIView? = nil, padding: CGFloat) -> [NSLayoutConstraint] {
        return constraintsAlignTopInside(containerView, above: view, horizontalPadding: padding, verticalPadding: padding)
    }

    @available(iOS 9.0, *)
    public func constraintsAlignAbove(_ view: UIView, inside containerView: UIView, horizontalPadding: CGFloat = 0, verticalPadding: CGFloat = 0) -> [NSLayoutConstraint] {
        return [
            leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: horizontalPadding),
            rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -horizontalPadding),
            bottomAnchor.constraint(equalTo: view.topAnchor, constant: -verticalPadding)
        ]
    }

    @available(iOS 9.0, *)
    public func constraintsAlignAbove(_ view: UIView, inside containerView: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
        return constraintsAlignAbove(view, inside: containerView, horizontalPadding: padding, verticalPadding: padding)
    }

    @available(iOS 9.0, *)
    public func constraintsAlignBelow(_ view: UIView, inside containerView: UIView, horizontalPadding: CGFloat = 0, verticalPadding: CGFloat = 0) -> [NSLayoutConstraint] {
        return [
            topAnchor.constraint(equalTo: view.bottomAnchor, constant: verticalPadding),
            leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: horizontalPadding),
            rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -horizontalPadding)
        ]
    }

    @available(iOS 9.0, *)
    public func constraintsAlignBelow(_ view: UIView, inside containerView: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
        return constraintsAlignBelow(view, inside: containerView, horizontalPadding: padding, verticalPadding: padding)
    }

    @available(iOS 9.0, *)
    public func constraintsAlignBottomInside(_ containerView: UIView, below view: UIView? = nil, horizontalPadding: CGFloat = 0, verticalPadding: CGFloat = 0) -> [NSLayoutConstraint] {

        var constraints: [NSLayoutConstraint] = [
            leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: horizontalPadding),
            rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -horizontalPadding),
            bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -verticalPadding)
        ]

        if let view = view {
            constraints.append(topAnchor.constraint(equalTo: view.bottomAnchor, constant: verticalPadding))
        }

        return constraints
    }

    @available(iOS 9.0, *)
    public func constraintsAlignBottomInside(_ containerView: UIView, below view: UIView? = nil, padding: CGFloat) -> [NSLayoutConstraint] {
        return constraintsAlignBottomInside(containerView, below: view, horizontalPadding: padding, verticalPadding: padding)
    }

    // MARK: Stack horizontally

}
