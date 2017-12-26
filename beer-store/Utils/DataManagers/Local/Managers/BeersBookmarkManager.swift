//
//  BeerBookmarkManager.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/24/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import Foundation

class BeersBookmarkManager: JSONManager {
    static var name = "BeersBookmarkJSON"
    static var beers: [Beer] = []

    static func containsBeer(_ beer: Beer) -> Bool {
        if beers.index(of: beer) != nil {
            return true
        }

        return false
    }

    static func bookmarkBeer(_ beer: Beer) -> Bool {
        if let index = beers.index(of: beer) {
            beers.remove(at: index)
            return false
        } else {
            beers.append(beer)
            return true
        }
    }

    static func loadData() {
         beers = self.readJSON()
    }

    static func saveData() {
        do {
            let data = try JSONEncoder().encode(beers) as NSData
            data.write(toFile: self.destinyPath!, atomically: true)
        } catch {
            print("Cannot write the JSON data")
        }
    }
}
