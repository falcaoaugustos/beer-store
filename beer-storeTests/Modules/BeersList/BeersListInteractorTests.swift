//
//  BeersListInteractorTests.swift
//  beer-storeTests
//
//  Created by Augusto Falcão on 12/29/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import XCTest
@testable import beer_store

class BeersListInteractorTests: XCTestCase {
    func testAddBookmarkedBeer() {
        let interactor = BeersListInteractor()
        BeersBookmarkManager.beers = []
        let result = interactor.bookmarkBeer(Beer(name: "", tagline: "", description: "", image_url: ""))
        XCTAssert(result)
    }

    func testAddAndRemoveBookmarkedBeer() {
        let interactor = BeersListInteractor()
        BeersBookmarkManager.beers = []
        interactor.bookmarkBeer(Beer(name: "", tagline: "", description: "", image_url: ""))
        let result = interactor.bookmarkBeer(Beer(name: "", tagline: "", description: "", image_url: ""))
        XCTAssertFalse(result)
    }
}
