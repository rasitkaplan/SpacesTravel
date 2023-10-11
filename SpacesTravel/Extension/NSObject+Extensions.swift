//
//  NSObject+Extensions.swift
//  SpacesTravel
//
//  Created by rasit on 27.09.2023.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
