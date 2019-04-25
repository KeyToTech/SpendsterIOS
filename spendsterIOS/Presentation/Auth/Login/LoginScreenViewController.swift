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
        self.interactions(enabled: false)
        self.whileIndicator.startAnimating()
    }
    
    func enableUIInteraction() {
        self.interactions(enabled: true)
        self.whileIndicator.stopAnimating()
    }
    
    func interactions(enabled: Bool) {
        self.emailTextField.isUserInteractionEnabled = enabled
        self.passwordTextField.isUserInteractionEnabled = enabled
        self.continueButton.isUserInteractionEnabled = enabled
        self.backButton.isUserInteractionEnabled = enabled
        self.veil.isHidden = enabled
        self.whileIndicator.isHidden = enabled
    }
}
