//
//  GradientView.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/4/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//  swiftlint:disable force_cast

import Foundation
import UIKit

class GradientView: UIView {
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    private var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    @IBInspectable var color1: UIColor = .white {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable var color2: UIColor = .white {
        didSet {
            updateColors()
        }
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureGradient()
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureGradient()
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    private func configureGradient() {
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        updateColors()
    }
    
    private func updateColors() {
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
    }
}
