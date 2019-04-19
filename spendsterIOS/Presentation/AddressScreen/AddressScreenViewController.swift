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
    @IBAction func getStartedButtonPressed(_ sender: Any) {
        self.errorMessage.isHidden = true
        self.presenter?.makeUpdate(name: name(), phoneNumber: phone())
    }

    func initDefaultUI() {
        self.errorMessage.isHidden = true
        self.nameTextField.text = ""
        self.phoneNumberTextField.text = ""
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
}
