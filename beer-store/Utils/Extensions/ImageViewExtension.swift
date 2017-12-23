//
//  ImageViewExtension.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/22/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

extension UIImageView {
    func updateImageFrom(string: String) {
        let req = URL(string: string)!

        URLSession.shared.dataTask(with: req) { (data, resp, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }

            guard let data = data else { return }
            self.image = UIImage(data: data)
        }.resume()
    }
}
