//
//  AddressScreenViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class AddressScreenViewController: UIViewController, AuthView {
    var presenter: AddressScreenPresenter?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    @IBAction func getStartedButtonPressed(_ sender: Any) {
        self.errorMessage.isHidden = true
        self.presenter?.makeUpdate(name: nameTextField.text!, phoneNumber: phoneNumberTextField.text!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorMessage.isHidden = true
        self.nameTextField.text = ""
        self.phoneNumberTextField.text = ""
        self.presenter = AddressScreenPresenter(view: self, model: MockAddrModel())
    }
    
    func showError(message: String) {
        self.errorMessage.text = message
        self.errorMessage.isHidden = false
    }
    
    func goToHomeScreen() {
        let storyboard = UIStoryboard(name: "HomeScreen", bundle: nil)
        if let homeScreenViewController = storyboard.instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController {
            present(homeScreenViewController, animated: true, completion: nil )
    }
}
}
