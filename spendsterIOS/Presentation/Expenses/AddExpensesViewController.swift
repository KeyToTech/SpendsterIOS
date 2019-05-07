//
//  AddExpensesViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/7/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class AddExpensesViewController: UIViewController {

    @IBOutlet weak var calendar: BorderView!
    @IBOutlet weak var category: BorderView!
    @IBOutlet weak var currency: BorderView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let categoryTap = UITapGestureRecognizer(target: self, action: #selector(self.categoryTapped(_:)))
        self.category.addGestureRecognizer(categoryTap)
        
        let currencyTap = UITapGestureRecognizer(target: self, action: #selector(self.currencyTapped(_:)))
        self.currency.addGestureRecognizer(currencyTap)

        let calendarTap = UITapGestureRecognizer(target: self, action: #selector(self.calendarTapped(_:)))
        self.calendar.addGestureRecognizer(calendarTap)

        
    }
    
    @objc func categoryTapped(_ sender: UITapGestureRecognizer) {
        print("category tapped!!1")
    }
    
    @objc func currencyTapped(_ sender: UITapGestureRecognizer) {
        print("currencyTapped tappedTEPPED YAAAY!!1")
    }
    
    @objc func calendarTapped(_ sender: UITapGestureRecognizer) {
        print("calendar tapped!!1")
    }
}
