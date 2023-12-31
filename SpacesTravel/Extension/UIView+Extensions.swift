//
//  UIView+Extensions.swift
//  SpacesTravel
//
//  Created by rasit on 27.09.2023.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
