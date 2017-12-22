//
//  BeerDescriptionContract.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/21/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

protocol BeerDetailsView: class {
    var presenter: BeerDetailsPresentation! { get set }

    func showDetails(forBeer beer: Beer)
}

protocol BeerDetailsPresentation: class {
    weak var view: BeerDetailsView? { get set }

    func viewDidLoad()
}

protocol BeerDetailsWireframe {
    static func assembleModule(withBeer beer: Beer) -> UIViewController
}
