//
//  BeerDescriptionViewController.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/22/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

class BeerDetailsViewController: UIViewController, BeerDetailsView {
    
    var presenter: BeerDetailsPresentation!

    @IBOutlet var beerImageView: UIImageView!
    @IBOutlet var beerNameLabel: UILabel!
    @IBOutlet var beerTaglineLabel: UILabel!
    @IBOutlet var beerDescriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    func showDetails(forBeer beer: Beer) {
        beerImageView.updateImageWith(urlString: beer.image_url)

        setupLabel(beerNameLabel, withText: beer.name, andBase: 25)
        setupLabel(beerTaglineLabel, withText: beer.tagline, andBase: 38)
        setupLabel(beerDescriptionLabel, withText: beer.description, andBase: 50)
    }

    func setupLabel(_ label: UILabel, withText text: String, andBase base: CGFloat) {
        label.font = label.font.withSize(UIScreen.main.bounds.height / base)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = text
    }
}
