//
//  JSONManager.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/24/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import Foundation

protocol JSONManager {
    static var name: String { get }

    static func loadData()
    static func saveData()
}

extension JSONManager {
    static var sourcePath: String? {
        return Bundle.main.path(forResource: self.name, ofType: "json")
    }

    static var destinyPath: String? {
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return "\(dir[0])/\(self.name).json"
    }

    static func saveData() {}

    static func readJSON<T: Decodable>() -> [T] {
        var array: [T] = []

        guard let source = self.sourcePath, let destiny = self.destinyPath else {
                print("[ERROR] source and/or destiny paths invalid")
                return []
        }

        if !(FileManager.default.fileExists(atPath: destiny)) {
            do {
                try FileManager.default.copyItem(atPath: source, toPath: destiny)
            } catch let error {
                print("[ERROR] \(error.localizedDescription)")
            }
        }

        if FileManager.default.fileExists(atPath: destiny) {
            do {
                let data = try NSData(contentsOfFile: destiny) as Data
                array = try JSONDecoder().decode([T].self, from: data)
            } catch let error {
                print(error.localizedDescription)
            }
        }

        return array
    }
}
