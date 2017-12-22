//
//  BeerDescriptionViewController.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/22/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

class BeerDescriptionViewController: UIViewController, BeerDescriptionView {
    
    var presenter: BeerDescriptionPresentation!

    @IBOutlet var beerImageView: UIImageView!
    @IBOutlet var detailsTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    func showDetails(forBeer beer: Beer) {
        detailsTextView.text = """
        \(beer.name)
        \(beer.tagline)

        \(beer.description)
        """
    }
}
