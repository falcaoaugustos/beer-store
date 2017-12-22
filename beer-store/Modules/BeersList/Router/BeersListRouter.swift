//
//  BeersListRouter.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/21/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

class BeersListRouter: BeersListWireframe {
    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "BeersListStoryboard", bundle: Bundle.main)
        let view = storyboard.instantiateInitialViewController() as? BeersListViewController
        let presenter = BeersListPresenter()
        let interactor = BeersListInteractor()
        let router = BeersListRouter()

        let navigation = UINavigationController(rootViewController: view!)

        view?.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        router.viewController = view

        return navigation
    }

    func presentBeerDetails(_ beer: Beer) {
        let beerDetailsModuleViewController = UIViewController()
        // assemble beer detail module
        viewController?.navigationController?.pushViewController(beerDetailsModuleViewController, animated: true)
    }
}
