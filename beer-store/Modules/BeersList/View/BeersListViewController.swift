//
//  BeersListViewController.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/20/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

class BeersListViewController: UIViewController, BeersListView, UITableViewDataSource, UITableViewDelegate {

    var presenter: BeersListPresentation!
    var beerCellHeight: CGFloat?

    @IBOutlet var beersListTableView: UITableView!
    var beersList: [Beer] = [] {
        didSet {
            DispatchQueue.main.async {
                self.beersListTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()

        presenter.viewDidLoad()
    }

    func setup() {
        beersListTableView.dataSource = self
        beersListTableView.delegate = self
        beersListTableView.register(UINib.init(nibName: "BeersListTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "BeersListCell")
        beerCellHeight = beersListTableView.bounds.height / 2
    }

    func showNoContentScreen() {
        // do nothing
    }

    func showBeersList(_ beers: [Beer]) {
        beersList = beers
    }

    // MARK: Table View Data Source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beersList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beer = beersList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeersListCell", for: indexPath) as! BeersListTableViewCell
        cell.setupWith(beer: beer)

        return cell
    }

    // MARK: Table View Data Delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectBeer(beersList[indexPath.row])
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return beerCellHeight ?? beersListTableView.bounds.height / 2
    }

}
