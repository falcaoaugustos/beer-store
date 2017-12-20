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
    var favorite: Bool
}
