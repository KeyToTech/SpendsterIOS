//
//  CornerButton.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 3/27/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//
// swiftlint:disable force_cast
import Foundation
import UIKit

@IBDesignable class CornerButton: UIButton {
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    
    
    override class var layerClass: AnyClass { return CAGradientLayer.self }

    private var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    @IBInspectable var color1: UIColor = .white { didSet { updateColors() } }
    @IBInspectable var color2: UIColor = .white  { didSet { updateColors() } }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureGradient()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureGradient()
    }
    
    private func configureGradient() {
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        updateColors()
    }
    
    private func updateColors() {
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
    }
}
