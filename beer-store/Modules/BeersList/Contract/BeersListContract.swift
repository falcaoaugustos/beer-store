//
//  BeersListContract.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/20/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

protocol BeersListView: class {
    var presenter: BeersListPresentation! { get set }

    func showNoContentScreen()
    func showBeersList(_ beers: [Beer])
}

protocol BeersListPresentation: class {
    weak var view: BeersListView? { get set }
    var interactor: BeersListUseCase! { get set }
    var router: BeersListWireframe! { get set }

    func viewDidLoad()
    func didPressedBookmarkButton()
    func didSelectBeer(_ beer: Beer)
}

protocol BeersListUseCase: class {
    weak var output: BeersListInteractorOutput? { get set }

    func fetchBeersList()
    func fetchBookmarkBeers()
}

protocol BeersListInteractorOutput: class {
    func beersListFetched(_ beers: [Beer])
}

protocol BeersListWireframe {
    weak var viewController: UIViewController? { get set }

    func presentBeerDetails(_ beer: Beer)

    static func assembleModule() -> UIViewController
}
