//
//  BeersListTableViewCell.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/20/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

class BeersListTableViewCell: UITableViewCell {
    @IBOutlet var beerImageView: UIImageView!
    @IBOutlet var beerNameLabel: UILabel!
    @IBOutlet var beerTaglineLabel: UILabel!

    func setupWith(beer: Beer) {
        beerImageView.updateImageFrom(string: beer.image_url)

        beerNameLabel.font = beerNameLabel.font.withSize(UIScreen.main.bounds.height / 30)
        beerNameLabel.lineBreakMode = .byWordWrapping
        beerNameLabel.numberOfLines = 0
        beerNameLabel.text = beer.name

        beerTaglineLabel.font = beerTaglineLabel.font.withSize(UIScreen.main.bounds.height / 43)
        beerTaglineLabel.lineBreakMode = .byWordWrapping
        beerTaglineLabel.numberOfLines = 0
        beerTaglineLabel.text = beer.tagline
    }
}
