//
//  CornerImage.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/3/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable class CornerImage: UIImageView {
    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
