//
//  Response.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/22/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import Foundation

enum Response {
    case json(_: Data?)
    case error(_: Int?, _: Error)

    init(_ response: (data: Data?, resp: HTTPURLResponse?, error: Error?), for request: ServiceRequest) {
        if let error = response.error {
            self = .error(response.resp?.statusCode, error)
            return
        }

        let data = response.data ?? Data()

        switch request.dataType {
        case .json:
            self = .json(data)
        }
    }
}
