//
//  BeerDescriptionContract.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/21/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

protocol BeerDescriptionView: class {
    var presenter: BeerDescriptionPresentation! { get set }

    func showDetails(forBeer beer: Beer)
}

protocol BeerDescriptionPresentation: class {
    weak var view: BeerDescriptionView? { get set }

    func viewDidLoad()
}

protocol BeerDescriptionWireframe {
    static func assembleModule(withBeer beer: Beer) -> UIViewController
}
