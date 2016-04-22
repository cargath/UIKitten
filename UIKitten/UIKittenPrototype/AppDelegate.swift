//
//  AppDelegate.swift
//  UIKittenPrototype
//
//  Created by Carsten Könemann on 21.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit

extension UINavigationController {

    // Convenience via builder pattern
    private func withTabBarItem(tabBarItem: UITabBarItem) -> UINavigationController {
        self.tabBarItem = tabBarItem
        return self
    }
    
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        // Override point for customization after application launch.

        UITabBarItem.appearance().setTitleTextAttributes([
            NSFontAttributeName: UIFont.systemFontOfSize(16)
        ], forState: .Normal)

        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -14)

        let tabBarController = UITabBarController()

        tabBarController.viewControllers = [
            UINavigationController(rootViewController: ViewController().withActivityIndicatorViewStyle(.WhiteLarge)).withTabBarItem(UITabBarItem(title: "WhiteLarge", image: nil, tag: 1)),
            UINavigationController(rootViewController: ViewController().withActivityIndicatorViewStyle(.White)).withTabBarItem(UITabBarItem(title: "White", image: nil, tag: 2)),
            UINavigationController(rootViewController: ViewController().withActivityIndicatorViewStyle(.Gray)).withTabBarItem(UITabBarItem(title: "Gray", image: nil, tag: 3))
        ]

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        return true
    }

}
