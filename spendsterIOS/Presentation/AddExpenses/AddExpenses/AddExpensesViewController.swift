//
//  AddExpensesViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/7/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class AddExpensesViewController: UIViewController, CategorySelectViewControllelDelegate, AddExpensesView {
    var choosenCategory: String?
    var currencyType = "UAH"
    var choosenDate = ""
    
    private var presenter: AddExpensesPresenter?
    @IBOutlet weak var errorLabel: UILabel!
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
        self.presenter?.addExpence(amount: self.amount(), createdDate: choosenDate, categoryId: choosenCategory, note: self.note())
    }
    
    func initDefaultUI() {
        self.errorLabel.isHidden = true
        self.veil.isHidden = true
        self.whileIndicator.isHidden = true
        self.whileIndicator.stopAnimating()
        self.priceTextField.text = ""
        self.noteTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = AddExpensesPresenter.init(view: self, model: SimpleAddExpensesModel(), storage: UserDefaultsStorage())
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
        // TODO
        // add currency
        // https://trello.com/c/EzCHVTtU/141-currency-for-expenses
    }
    
    @objc func calendarTapped(_ sender: UITapGestureRecognizer) {
        // TODO
        // add calendar
        // https://trello.com/c/x3Hhjg6s/140-calendar-for-expenses
    }
    
    func categoryChoosed(categoryId catedoryId: String?, categoryLabel: String?) {
        self.categoryLabel.text = categoryLabel
        self.choosenCategory = catedoryId
    }
    
    func showLoading() {
        self.interactions(enabled: false)
        self.whileIndicator.startAnimating()
    }
    
    func hideLoading() {
        self.interactions(enabled: true)
        self.whileIndicator.stopAnimating()
    }
    
    private func interactions(enabled: Bool) {
        self.veil.isHidden = enabled
        self.whileIndicator.isHidden = enabled
    }
    
    func showError(withMessage: String) {
        self.errorLabel.text = withMessage
        self.errorLabel.isHidden = false
    }
    
    func goToHomeScreen() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func amount() -> String {
        return self.priceTextField.text!
    }
    
    private func note() -> String {
        return self.noteTextField.text!
    }
}
