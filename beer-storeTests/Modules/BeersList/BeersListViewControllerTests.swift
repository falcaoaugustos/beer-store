//
//  BeersListViewControllerTests.swift
//  beer-storeTests
//
//  Created by Augusto Falcão on 12/27/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import XCTest
@testable import beer_store

class BeersListViewControllerTests: XCTestCase {
    func testShowNoContent() {
        let viewController = BeersListViewController()
        viewController.beersListTableView = UITableView()
        viewController.beersList = [Beer(name: "", tagline: "", description: "", image_url: "")]
        viewController.showNoContentScreen()
        XCTAssertEqual([], viewController.beersList)
    }

    func testShowNoContentFailure() {
        let viewController = BeersListViewController()
        viewController.beersListTableView = UITableView()
        viewController.beersList = [Beer(name: "", tagline: "", description: "", image_url: "")]
        viewController.showNoContentScreen()
        XCTAssertNotEqual([Beer(name: "", tagline: "", description: "", image_url: "")], viewController.beersList)
    }

    func testShowBeersList() {
        let viewController = BeersListViewController()
        viewController.beersListTableView = UITableView()
        viewController.beersList = []
        viewController.showBeersList([Beer(name: "", tagline: "", description: "", image_url: "")])
        XCTAssertEqual([Beer(name: "", tagline: "", description: "", image_url: "")], viewController.beersList)
    }

    func testShowBeersListFailure() {
        let viewController = BeersListViewController()
        viewController.beersListTableView = UITableView()
        viewController.beersList = []
        viewController.showBeersList([Beer(name: "", tagline: "", description: "", image_url: "")])
        XCTAssertNotEqual([], viewController.beersList)
    }
}
