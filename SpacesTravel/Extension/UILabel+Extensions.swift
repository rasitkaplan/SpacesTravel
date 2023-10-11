//
//  UILabel+Extensions.swift
//  SpacesTravel
//
//  Created by rasit on 27.09.2023.
//

import Foundation
import UIKit

extension UILabel {
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 1
        layer.shadowOpacity = 2
        layer.masksToBounds = false
        layer.shouldRasterize = true
    }
}
