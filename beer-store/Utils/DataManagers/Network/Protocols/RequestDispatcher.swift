//
//  RequestDispatcher.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/22/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import Foundation

protocol RequestDispatcher {
    init(baseURL: String)
    func execute(request: ServiceRequest)
}
