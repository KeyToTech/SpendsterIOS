//
//  EditExpenseViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/31/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class EditExpenseViewController: UIViewController, ExpenseButtonDelegate {
    func didDeleteButtonPressed() {
        print("delete")
        // TODO in mvp implementation
        // https://trello.com/c/5i6aaZ1r/187-editexpense-mvp-implementation
    }
    
    func didCalcelButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func didAddButtonPressed() {
        print("Add")
        // TODO in mvp implementation
        // https://trello.com/c/5i6aaZ1r/187-editexpense-mvp-implementation
    }
    
    @IBOutlet weak var expenseView: ExpenseView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initDefaultUI()
        self.expenseView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func initDefaultUI() {
        self.navigationController?.navigationBar.isHidden = true
        self.expenseView.veil.isHidden = true
        self.expenseView.whileIndicator.isHidden = true
        self.expenseView.errorLabel.isHidden = true
    }
}
