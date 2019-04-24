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
        interactions(enabled: false)
        self.whileIndicator.startAnimating()
    }
    
    func enableUIInteraction() {
        interactions(enabled: true)
        self.whileIndicator.stopAnimating()
    }
    
    func interactions(enabled: Bool) {
        self.nameTextField.isUserInteractionEnabled = enabled
        self.phoneNumberTextField.isUserInteractionEnabled = enabled
        self.backButton.isUserInteractionEnabled = enabled
        self.getStartedButton.isUserInteractionEnabled = enabled
        self.veil.isHidden = enabled
        self.whileIndicator.isHidden = enabled
    }
}
