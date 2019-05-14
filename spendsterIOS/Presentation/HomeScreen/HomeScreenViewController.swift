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
        UserDefaultsStorage.clear()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Expenses", bundle: nil)
        if let addExpensesViewController = storyboard.instantiateViewController(withIdentifier: "AddExpensesViewController") as? AddExpensesViewController {
            self.navigationController?.pushViewController(addExpensesViewController, animated: true)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
