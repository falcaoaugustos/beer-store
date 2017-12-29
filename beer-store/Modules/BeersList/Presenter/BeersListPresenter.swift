//
//  BeersListPresenter.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/20/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

class BeersListPresenter: BeersListPresentation, BeersListInteractorOutput {
    weak var view: BeersListView?
    var interactor: BeersListUseCase!
    var router: BeersListWireframe!

    func loadBeersList() {
        interactor.fetchBeersList()
    }

    func loadBookmarkedBeersList() {
        interactor.fetchBookmarkBeers()
    }

    func didPressedButton(withTitle title: String) -> String {
        switch title {
        case "Bookmark List":
            loadBookmarkedBeersList()
            return "Beers List"
        case "Beers List":
            loadBeersList()
            return "Bookmark List"
        default:
            return "Beers List"
        }
    }

    func didPressedBookmarkCellButton(of beer: Beer) -> UIColor {
        return interactor.bookmarkBeer(beer) ? .orange : .clear
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
