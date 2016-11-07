//
//  DrawerView.swift
//  UIKitten
//
//  Created by Carsten Könemann on 24.04.16.
//  Copyright © 2016 cargath. All rights reserved.
//

import UIKit

public protocol DrawerViewDataSource: class {
    func widthForDrawerView(_ drawerView: DrawerView) -> CGFloat
}

open class DrawerView: UIView {
    open weak var dataSource: DrawerViewDataSource?
}
