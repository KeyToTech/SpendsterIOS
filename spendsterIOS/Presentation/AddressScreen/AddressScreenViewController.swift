//
//  AddressScreenViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class AddressScreenViewController: UIViewController, AuthView {
    private var presenter: AddressScreenPresenter?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var getStartedButton: CornerButton!
    @IBOutlet weak var veil: UIView!
    @IBOutlet weak var whileIndicator: UIActivityIndicatorView!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func getStartedButtonPressed(_ sender: Any) {
        self.errorMessage.isHidden = true
        self.presenter?.makeUpdate(name: name(), phoneNumber: phone())
    }

    func initDefaultUI() {
        self.errorMessage.isHidden = true
        self.nameTextField.text = ""
        self.phoneNumberTextField.text = ""
        self.veil.isHidden = true
        self.whileIndicator.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initDefaultUI()
        self.presenter = AddressScreenPresenter(view: self, model: MockAddrModel())
    }
    
    func showError(message: String) {
        self.errorMessage.text = message
        self.errorMessage.isHidden = false
    }
    
    func goToHomeScreen() {
        dismiss(animated: true, completion: nil)
    }
    
    func name() -> String {
        return self.nameTextField.text!
    }
    
    func phone() -> String {
        return self.phoneNumberTextField.text!
    }
    
    func disableUIInteraction() {
        self.nameTextField.isUserInteractionEnabled = false
        self.phoneNumberTextField.isUserInteractionEnabled = false
        self.backButton.isUserInteractionEnabled = false
        self.getStartedButton.isUserInteractionEnabled = false
        self.veil.isHidden = false
        self.whileIndicator.isHidden = false
        self.whileIndicator.startAnimating()
    }
    
    func enableUIInteraction() {
        self.nameTextField.isUserInteractionEnabled = true
        self.phoneNumberTextField.isUserInteractionEnabled = true
        self.backButton.isUserInteractionEnabled = true
        self.getStartedButton.isUserInteractionEnabled = true
        self.veil.isHidden = true
        self.whileIndicator.isHidden = true
        self.whileIndicator.stopAnimating()
    }
}
