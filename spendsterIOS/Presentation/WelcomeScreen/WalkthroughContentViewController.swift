//
//  WalkthroughContentViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 3/22/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {

    var index = 0
    var subheading = ""
    var contentText = ""
    var imageName = ""
    @IBOutlet var subheadingLabel: UILabel! {
        didSet {
            subheadingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var contentTextLabel: UILabel! {
        didSet {
            contentTextLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var contentImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        subheadingLabel.text = subheading
        contentTextLabel.text = contentText
        contentImageView.image = UIImage(named: imageName)
    }
}
