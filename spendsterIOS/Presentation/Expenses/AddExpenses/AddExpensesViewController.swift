//
//  AddExpensesViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/7/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class AddExpensesViewController: UIViewController, CategorySelectViewControllelDelegate {
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var calendar: BorderView!
    @IBOutlet weak var category: BorderView!
    @IBOutlet weak var currency: BorderView!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var veil: UIView!
    @IBOutlet weak var whileIndicator: UIActivityIndicatorView!
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func addTransactionButtonPressed(_ sender: Any) {
        
    }
    
    func initDefaultUI() {
        self.veil.isHidden = true
        self.whileIndicator.isHidden = true
        self.whileIndicator.stopAnimating()
        self.priceTextField.text = ""
        self.noteTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initDefaultUI()
        self.tapGestureRecognizer()
        
    }
    
    func tapGestureRecognizer() {
        let categoryTap = UITapGestureRecognizer(target: self, action: #selector(self.categoryTapped(_:)))
        self.category.addGestureRecognizer(categoryTap)
        
        let currencyTap = UITapGestureRecognizer(target: self, action: #selector(self.currencyTapped(_:)))
        self.currency.addGestureRecognizer(currencyTap)
        
        let calendarTap = UITapGestureRecognizer(target: self, action: #selector(self.calendarTapped(_:)))
        self.calendar.addGestureRecognizer(calendarTap)
    }
    
    @objc func categoryTapped(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Expenses", bundle: nil)
        if let categorySelectViewController = storyboard.instantiateViewController(withIdentifier: "CategorySelectViewController") as? CategorySelectViewController {
            categorySelectViewController.delegate = self
            self.present(categorySelectViewController, animated: false, completion: nil)
            
        }
    }
    
    @objc func currencyTapped(_ sender: UITapGestureRecognizer) {
        print("currencyTapped tappedTEPPED YAAAY!!1")
    }
    
    @objc func calendarTapped(_ sender: UITapGestureRecognizer) {
        print("calendar tapped!!1")
    }
    
    func categoryChoosed(data: String?) {
        self.categoryLabel.text = data
    }
    
    func disableUIInteraction() {
        self.interactions(enabled: false)
        self.whileIndicator.startAnimating()
    }
    
    func enableUIInteraction() {
        self.interactions(enabled: true)
        self.whileIndicator.stopAnimating()
    }
    
    func interactions(enabled: Bool) {
        self.veil.isHidden = enabled
        self.whileIndicator.isHidden = enabled
    }
}
