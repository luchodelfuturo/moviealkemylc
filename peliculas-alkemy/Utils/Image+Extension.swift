//
//  Image+Extension.swift
//  peliculas-alkemy
//
//  Created by Luciano Federico Castro on 19/07/2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(url: String){
        self.kf.setImage(with: URL(string: url))
    }
}
