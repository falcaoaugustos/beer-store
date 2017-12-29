//
//  BeersListPresenterTests.swift
//  beer-storeTests
//
//  Created by Augusto Falcão on 12/29/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import XCTest
@testable import beer_store

class BeersListPresenterTests: XCTestCase {
    func testDidPressedButtonWithBeersListTitle() {
        let presenter = BeersListPresenter()
        let interactor = BeersListInteractor()
        presenter.interactor = interactor
        let result = presenter.didPressedButton(withTitle: "Beers List")
        XCTAssertEqual(result, "Bookmark List")
    }

    func testDidPressedButtonWithBookmarkListTitle() {
        let presenter = BeersListPresenter()
        let interactor = BeersListInteractor()
        presenter.interactor = interactor
        let result = presenter.didPressedButton(withTitle: "Bookmark List")
        XCTAssertEqual(result, "Beers List")
    }

    func testDidPressedButtonWithRandomTitle() {
        let presenter = BeersListPresenter()
        let result = presenter.didPressedButton(withTitle: "")
        XCTAssertEqual(result, "Beers List")
    }

    func testDidPressedBookmarkAddAndRemoveCellButton() {
        let presenter = BeersListPresenter()
        let interactor = BeersListInteractor()
        presenter.interactor = interactor
        presenter.didPressedBookmarkCellButton(of: Beer(name: "", tagline: "", description: "", image_url: ""))
        let result = presenter.didPressedBookmarkCellButton(of: Beer(name: "", tagline: "", description: "", image_url: ""))
        XCTAssertEqual(result, .clear)
    }

    func testDidPressedBookmarkAddCellButton() {
        let presenter = BeersListPresenter()
        let interactor = BeersListInteractor()
        presenter.interactor = interactor
        let result = presenter.didPressedBookmarkCellButton(of: Beer(name: "", tagline: "", description: "", image_url: ""))
        XCTAssertEqual(result, .orange)
    }
}
