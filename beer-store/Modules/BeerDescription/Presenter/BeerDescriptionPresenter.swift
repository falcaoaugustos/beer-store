//
//  BeerDescriptionPresenter.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/21/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import Foundation

class BeerDescriptionPresenter: BeerDescriptionPresentation {
    var view: BeerDescriptionView?

    var beer: Beer!

    func viewDidLoad() {
        view?.showDetails(forBeer: beer)
    }
}
