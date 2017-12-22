//
//  BeerDescriptionRouter.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/22/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

class BeerDetailsRouter: BeerDetailsWireframe {

    static func assembleModule(withBeer beer: Beer) -> UIViewController {
        let storyboard = UIStoryboard(name: "BeerDetailsStoryboard", bundle: Bundle.main)
        let view = storyboard.instantiateInitialViewController() as? BeerDetailsViewController
        let presenter = BeerDetailsPresenter()

        view?.presenter = presenter

        presenter.view = view
        presenter.beer = beer

        return view!
    }
}
