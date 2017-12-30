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

    var presenter: BeersListPresentation!

    var delegate: BeersListTableViewCellDelegate? = nil

    func setupWith(beer: Beer, andPresenter presenter: BeersListPresentation) {
        beerImageView.updateImageWith(urlString: beer.image_url)

        setupLabel(beerNameLabel, withText: beer.name, andBase: 30)
        setupLabel(beerTaglineLabel, withText: beer.tagline, andBase: 43)

        self.beer = beer
        self.presenter = presenter
    }

    func setupLabel(_ label: UILabel, withText text: String, andBase base: CGFloat) {
        label.font = label.font.withSize(UIScreen.main.bounds.height / base)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = text
    }

    @IBAction func didPressedBookmarkBeerButton() {
        guard let beer = beer else { return }

        backgroundColor = UIColor.getUserInterfaceColor(presenter.didPressedBookmarkCellButton(of: beer))

        delegate?.didPressedBookmarkBeer()
    }
}
