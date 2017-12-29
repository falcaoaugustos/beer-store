//
//  UIColorExtension.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/29/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

extension UIColor {
    static func getUserInterfaceColor(_ color: UserInterfaceColor) -> UIColor {
        switch color {
        case .orange:
            return UIColor.orange
        case .clear:
            return UIColor.clear
        }
    }
}
