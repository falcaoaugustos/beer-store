//
//  ImageViewExtension.swift
//  beer-store
//
//  Created by Augusto Falcão on 12/22/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func updateImageWith(urlString: String) {
        let url = URL(string: urlString)!

        self.kf.setImage(with: url)
    }
}
