//
//  UserService.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/22/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import Foundation

enum UserService: ServiceRequest {
    case getBeersList

    var path: String {
        switch self {
        case .getBeersList:
            return "/beers"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getBeersList:
            return .get
        }
    }

    var body: Data? {
        switch self {
        case .getBeersList:
            return nil
        }
    }

    var header: [String: String]? {
        switch self {
        case .getBeersList:
            return nil
        }
    }

    var dataType: ResponseType {
        switch self {
        case .getBeersList:
            return .json
        }
    }
}
