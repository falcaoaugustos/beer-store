//
//  BeersListTableViewCell.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/20/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

protocol BeersListTableViewCellDelegate {
    func didPressedBookmarkBeer()
}

class BeersListTableViewCell: UITableViewCell {
    @IBOutlet var beerImageView: UIImageView!
    @IBOutlet var beerNameLabel: UILabel!
    @IBOutlet var beerTaglineLabel: UILabel!

    var beer: Beer?

    var delegate: BeersListTableViewCellDelegate? = nil

    func setupWith(beer: Beer) {
        beerImageView.updateImageWith(urlString: beer.image_url)

        beerNameLabel.font = beerNameLabel.font.withSize(UIScreen.main.bounds.height / 30)
        beerNameLabel.lineBreakMode = .byWordWrapping
        beerNameLabel.numberOfLines = 0
        beerNameLabel.text = beer.name

        beerTaglineLabel.font = beerTaglineLabel.font.withSize(UIScreen.main.bounds.height / 43)
        beerTaglineLabel.lineBreakMode = .byWordWrapping
        beerTaglineLabel.numberOfLines = 0
        beerTaglineLabel.text = beer.tagline

        self.beer = beer
    }

    @IBAction func didPressedBookmarkBeerButton() {
        guard let beer = beer else { return }
        
        backgroundColor = BeersBookmarkManager.bookmarkBeer(beer) ? .orange : .clear

        delegate?.didPressedBookmarkBeer()

        print("Bookmark:", BeersBookmarkManager.beers, "\n")
    }
}
