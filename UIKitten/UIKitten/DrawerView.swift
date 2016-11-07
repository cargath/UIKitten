//
//  DrawerView.swift
//  UIKitten
//
//  Created by Carsten Könemann on 24.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit

public protocol DrawerViewDataSource: class {
    func widthForDrawerView(drawerView: DrawerView) -> CGFloat
}

public class DrawerView: UIView {
    public weak var dataSource: DrawerViewDataSource?
}
