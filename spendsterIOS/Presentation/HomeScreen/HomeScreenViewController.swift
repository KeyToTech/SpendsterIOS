//
//  HomeScreenViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    @IBAction func logOutButtonPressed(_ sender: Any) {
        // TODO remove loguot button from main screen and add it to profile screen
        // ticket: https://trello.com/c/ck0DDnn8/127-profile-screen
        UserDefaults.standard.set(false, forKey: "alreadyLoggedIn")
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
