//
//  BeersListPresenter.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/20/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import Foundation

class BeersListPresenter: BeersListPresentation, BeersListInteractorOutput {
    weak var view: BeersListView?
    var interactor: BeersListUseCase!
    var router: BeersListWireframe!

    func viewDidLoad() {
        interactor.fetchBeersList()
    }

    func didPressedBookmarkButton() {
        interactor.fetchBookmarkBeers()
    }

    func didSelectBeer(_ beer: Beer) {
        router.presentBeerDetails(beer)
    }

    // MARK: Beers List Interactor Output

    func beersListFetched(_ beers: [Beer]) {
        if beers.count > 0 {
            view?.showBeersList(beers)
        } else {
            view?.showNoContentScreen()
        }
    }
}
