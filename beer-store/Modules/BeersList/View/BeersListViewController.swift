//
//  BeersListViewController.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/20/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

class BeersListViewController: UIViewController, BeersListView, BeersListTableViewCellDelegate, UITableViewDataSource, UITableViewDelegate {

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

    var bookmarkButton: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()

        presenter.loadBeersList()
    }

    func setup() {
        setupBeersListTableView()
        setupNavigationController()
    }

    func setupBeersListTableView() {
        beersListTableView.dataSource = self
        beersListTableView.delegate = self
        beersListTableView.register(UINib.init(nibName: "BeersListTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "BeersListCell")
        beerCellHeight = beersListTableView.bounds.height / 2
    }

    func setupNavigationController() {
        navigationController?.navigationBar.barStyle = .black

        let bookmark = UIBarButtonItem(title: "Bookmark List", style: .plain, target: self, action: #selector(didPressedBookmarkButton))
        navigationItem.setRightBarButton(bookmark, animated: false)
        bookmarkButton = bookmark
    }

    @objc func didPressedBookmarkButton() {
        guard let title = bookmarkButton?.title else { return }

        bookmarkButton?.title = presenter.didPressedButton(withTitle: title)
    }

    func showNoContentScreen() {
        beersList = []
    }

    func showBeersList(_ beers: [Beer]) {
        beersList = beers
    }

    // MARK: Beers List Table View Cell Delegate

    func didPressedBookmarkBeer() {
        if let title = bookmarkButton?.title, title == "Beers List" {
            presenter.loadBookmarkedBeersList()
        }
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
        cell.delegate = self
        cell.backgroundColor = BeersBookmarkManager.containsBeer(beer) ? .orange : .clear
        cell.setupWith(beer: beer, andPresenter: presenter)

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
