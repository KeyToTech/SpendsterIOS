//
//  SignUpViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 3/28/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class SignUpScreenViewController: UIViewController, AuthView {
    var presenter: SignUpPresenter?
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var veil: UIView!
    @IBOutlet weak var whileIndicator: UIActivityIndicatorView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        errorMessage.isHidden = true
        presenter?.signUp(email: self.email(), username: self.username(), password: self.password(), rePassword: self.rePassword())
    }
    
    func showError(message: String) {
        errorMessage.text = message
        errorMessage.isHidden = false
    }
    
    func goToHomeScreen() {
        let storyboard = UIStoryboard(name: "MoreAbout", bundle: nil)
        if let moreAboutScreenViewController = storyboard.instantiateViewController(withIdentifier: "MoreAboutScreenViewController") as? MoreAboutScreenViewController {
            self.navigationController?.pushViewController(moreAboutScreenViewController, animated: true)
        }
    }

    func initDefaultUI() {
        self.emailTextField.text = ""
        self.usernameTextField.text = ""
        self.passwordTextField.text = ""
        self.rePasswordTextField.text = ""
        self.veil.isHidden = true
        self.errorMessage.isHidden = true
        self.whileIndicator.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDefaultUI()
        self.presenter = SignUpPresenter(model: SignUpModel(), view: self)
    }
    
    func email() -> String {
        return self.emailTextField.text!
    }
    
    func username() -> String {
        return self.usernameTextField.text!
    }
    
    func password() -> String {
        return self.passwordTextField.text!
    }
    
    func rePassword() -> String {
        return self.rePasswordTextField.text!
    }
    
    func disableUIInteraction() {
        self.emailTextField.isUserInteractionEnabled = false
        self.usernameTextField.isUserInteractionEnabled = false
        self.passwordTextField.isUserInteractionEnabled = false
        self.rePasswordTextField.isUserInteractionEnabled = false
        self.continueButton.isUserInteractionEnabled = false
        self.backButton.isUserInteractionEnabled = false
        self.veil.isHidden = false
        self.whileIndicator.isHidden = false
        self.whileIndicator.startAnimating()
    }
    
    func enableUIInteraction() {
        self.emailTextField.isUserInteractionEnabled = true
        self.usernameTextField.isUserInteractionEnabled = true
        self.passwordTextField.isUserInteractionEnabled = true
        self.rePasswordTextField.isUserInteractionEnabled = true
        self.continueButton.isUserInteractionEnabled = true
        self.backButton.isUserInteractionEnabled = true
        self.veil.isHidden = true
        self.whileIndicator.isHidden = true
        self.whileIndicator.stopAnimating()
    }
}
