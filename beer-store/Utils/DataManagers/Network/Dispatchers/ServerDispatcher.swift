//
//  ServerDispatcher.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/22/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import Foundation

protocol ServerDispatcherDelegate {
    func didReceiveRequestResponseData(_ data: Data?)
}

class ServerDispatcher: RequestDispatcher {

    private var baseURL: BaseURL
    var delegate: ServerDispatcherDelegate? = nil

    required init(baseURL: BaseURL) {
        self.baseURL = baseURL
    }

    func execute(request: ServiceRequest) {
        let requestURL = prepareURLRequest(for: request)

        switch request.dataType {
        case .json:
            var req = URLRequest(url: requestURL)
            req.httpMethod = request.method.rawValue
            req.httpBody = request.body
            req.allHTTPHeaderFields = request.header

            URLSession.shared.dataTask(with: req) { (data, resp, error) in
                let serverResponse = Response((data: data, resp: resp as? HTTPURLResponse, error: error), for: request)

                switch serverResponse {
                case let .error(httpErrorCode, error):
                    print("Error \(httpErrorCode ?? 400): \(error.localizedDescription)")
                case .json(let data):
                    self.delegate?.didReceiveRequestResponseData(data)
                }
            }.resume()
        }
    }

    private func prepareURLRequest(for request: ServiceRequest) -> URL {
        return URL(string: "\(baseURL.rawValue)\(request.path)")!
    }
}
