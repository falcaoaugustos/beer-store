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

        beerNameLabel.font = beerNameLabel.font.withSize(UIScreen.main.bounds.height / 25)
        beerNameLabel.lineBreakMode = .byWordWrapping
        beerNameLabel.numberOfLines = 0
        beerNameLabel.text = beer.name

        beerTaglineLabel.font = beerTaglineLabel.font.withSize(UIScreen.main.bounds.height / 38)
        beerTaglineLabel.lineBreakMode = .byWordWrapping
        beerTaglineLabel.numberOfLines = 0
        beerTaglineLabel.text = beer.tagline

        beerDescriptionLabel.font = beerDescriptionLabel.font.withSize(UIScreen.main.bounds.height / 50)
        beerDescriptionLabel.lineBreakMode = .byWordWrapping
        beerDescriptionLabel.numberOfLines = 0
        beerDescriptionLabel.text = beer.description
    }
}
