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
    fileprivate func withTabBarItem(_ tabBarItem: UITabBarItem) -> UINavigationController {
        self.tabBarItem = tabBarItem
        return self
    }
    
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // Override point for customization after application launch.

        UITabBarItem.appearance().setTitleTextAttributes([
            NSFontAttributeName: UIFont.systemFont(ofSize: 16)
        ], for: UIControlState())

        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -14)

        let tabBarController = UITabBarController()

        tabBarController.viewControllers = [
            UINavigationController(rootViewController: ViewController().withActivityIndicatorViewStyle(.whiteLarge)).withTabBarItem(UITabBarItem(title: "WhiteLarge", image: nil, tag: 1)),
            UINavigationController(rootViewController: ViewController().withActivityIndicatorViewStyle(.white)).withTabBarItem(UITabBarItem(title: "White", image: nil, tag: 2)),
            UINavigationController(rootViewController: ViewController().withActivityIndicatorViewStyle(.gray)).withTabBarItem(UITabBarItem(title: "Gray", image: nil, tag: 3))
        ]

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        return true
    }

}
