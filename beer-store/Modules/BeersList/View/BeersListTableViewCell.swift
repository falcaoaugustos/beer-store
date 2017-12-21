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
        beerNameLabel.text = beer.name
        beerTaglineLabel.text = beer.tagline
    }
}
