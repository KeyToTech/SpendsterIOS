//
//  LoginScreenViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/2/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController, AuthView {
    var presenter: LoginPresenter?
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        errorMessage.isHidden = true
        presenter?.login(email: self.email(), password: self.password())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
        errorMessage.isHidden = true
        self.presenter = LoginPresenter(model: MockLogin(), view: self)
    }
    
    func showError(message: String) {
        errorMessage.text = message
        errorMessage.isHidden = false
    }
    
    func goToHomeScreen() {
        let storyboard = UIStoryboard(name: "HomeScreen", bundle: nil)
        if let homeScreenViewController = storyboard.instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController {
            self.navigationController?.pushViewController(homeScreenViewController, animated: true)
        }
    }
    
    func email() -> String {
        return self.emailTextField.text!
    }
    
    func password() -> String {
        return self.passwordTextField.text!
    }
}
