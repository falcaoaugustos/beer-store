//
//  ServiceRequest.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/22/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import Foundation

enum ResponseType {
    case json
}

enum HTTPMethod: String {
    case get = "GET"
}

protocol ServiceRequest {
    var path: String { get }
    var method: HTTPMethod { get }
    var body: Data? { get }
    var header: [String: String]? { get }
    var dataType: ResponseType { get }
}
