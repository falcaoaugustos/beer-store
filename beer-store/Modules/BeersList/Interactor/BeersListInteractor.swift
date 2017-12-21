//
//  BeerListInteractor.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/20/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import Foundation

class BeersListInteractor: BeersListUseCase {
    weak var output: BeersListInteractorOutput?

    func fetchBeersList() {
        let url = URL(string: "https://api.punkapi.com/v2/beers")

        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                self.output?.beersListFetchFailed()
            } else {
                guard let data = data else { return }

                do {
                    let beersList = try JSONDecoder().decode([Beer].self, from: data)
                    self.output?.beersListFetched(beersList)
                } catch let error {
                    print("Serializtion Error: \(error)")
                }
            }
        }.resume()
    }
}
