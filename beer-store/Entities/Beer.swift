//
//  Beer.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/20/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import Foundation

struct Beer: Codable {
    var name: String
    var tagline: String
    var description: String
    var image_url: String
}

extension Beer: Equatable {
    static func == (lhs: Beer, rhs: Beer) -> Bool {
        return lhs.name == rhs.name
            && lhs.tagline == rhs.tagline
            && lhs.description == rhs.description
            && lhs.image_url == rhs.image_url
    }
}
