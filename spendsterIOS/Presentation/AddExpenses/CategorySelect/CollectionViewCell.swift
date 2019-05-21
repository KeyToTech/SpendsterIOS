//
//  CollectionViewCell.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/8/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    func bind(label: String, image: String) {
        self.categoryLabel.text = label
        self.categoryImage.image = UIImage(named: image)
    }
}
