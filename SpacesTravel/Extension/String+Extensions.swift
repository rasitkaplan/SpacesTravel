//
//  String+Extensions.swift
//  SpacesTravel
//
//  Created by rasit on 27.09.2023.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
