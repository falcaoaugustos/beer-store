//
//  BeerListInteractor.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/20/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import Foundation

class BeersListInteractor: BeersListUseCase, ServerDispatcherDelegate {

    weak var output: BeersListInteractorOutput?

    func fetchBeersList() {
        let request = UserService.getBeersList
        let dispatcher = ServerDispatcher(baseURL: .punkAPI)
        dispatcher.delegate = self
        dispatcher.execute(request: request)
    }

    // MARK: Server Dispatcher Delegate

    func didReceiveRequestResponseData(_ data: Data?) {
        guard let data = data else { return }

        do {
            let beersList = try JSONDecoder().decode([Beer].self, from: data)
            self.output?.beersListFetched(beersList)
        } catch let error {
            print("Serializtion Error: \(error)")
        }
    }
}
