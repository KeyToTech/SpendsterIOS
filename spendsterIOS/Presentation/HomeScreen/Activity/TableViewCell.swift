//
//  TableViewCell.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/21/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    func bind(category: String, image: String, price: String, note: String) {
        self.categoryLabel.text = category
        self.categoryImage.image = UIImage(named: image)
        self.noteLabel.text = note
        self.priceLabel.text = price
    }
}
