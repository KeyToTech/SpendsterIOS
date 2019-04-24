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
    @IBOutlet weak var continueButton: CornerButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var veil: UIView!
    @IBOutlet weak var whileIndicator: UIActivityIndicatorView!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        errorMessage.isHidden = true
        presenter?.login(email: self.email(), password: self.password())
    }
    
    func initDefaultUI() {
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
        self.errorMessage.isHidden = true
        self.veil.isHidden = true
        self.whileIndicator.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDefaultUI()
        self.presenter = LoginPresenter(model: LoginModel(), view: self)
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
    
    func disableUIInteraction() {
        self.emailTextField.isUserInteractionEnabled = false
        self.passwordTextField.isUserInteractionEnabled = false
        self.continueButton.isUserInteractionEnabled = false
        self.backButton.isUserInteractionEnabled = false
        self.veil.isHidden = false
        self.whileIndicator.isHidden = false
        self.whileIndicator.startAnimating()
    }
    
    func enableUIInteraction() {
        self.emailTextField.isUserInteractionEnabled = true
        self.passwordTextField.isUserInteractionEnabled = true
        self.continueButton.isUserInteractionEnabled = true
        self.backButton.isUserInteractionEnabled = true
        self.veil.isHidden = true
        self.whileIndicator.isHidden = true
        self.whileIndicator.stopAnimating()
    }
}
