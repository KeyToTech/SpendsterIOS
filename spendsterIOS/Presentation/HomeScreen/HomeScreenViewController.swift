//
//  HomeScreenViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController, ActivityNavigationControllerDelegate {
    func didUpdatePageHeading() {
        self.headerLabel.text = "Activity"
    }
    
    @IBOutlet weak var headerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
