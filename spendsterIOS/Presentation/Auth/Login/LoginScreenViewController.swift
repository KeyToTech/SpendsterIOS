//
//  LoginScreenViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/2/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController, AuthView, UITextFieldDelegate {
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
    
    private func initDefaultUI() {
        self.errorMessage.isHidden = true
        self.veil.isHidden = true
        self.whileIndicator.isHidden = true
        self.emailTextField.text = ""
        self.emailTextField.delegate = self
        self.emailTextField.keyboardType = UIKeyboardType.emailAddress
        self.passwordTextField.text = ""
        self.passwordTextField.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDefaultUI()
        self.presenter = LoginPresenter(model: SimpleLoginModel(), view: self, storage: UserDefaultsStorage())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.emailTextField.becomeFirstResponder()
    }
    
    func showError(withMessage: String) {
        errorMessage.text = withMessage
        errorMessage.isHidden = false
    }
    
    func goToHomeScreen() {
        let storyboard = UIStoryboard(name: "HomeScreen", bundle: nil)
        if let homeScreenViewController = storyboard.instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController {
            self.navigationController?.pushViewController(homeScreenViewController, animated: true)
        }
    }
    
    private func email() -> String {
        return self.emailTextField.text!
    }
    
    private func password() -> String {
        return self.passwordTextField.text!
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
        self.emailTextField.isUserInteractionEnabled = enabled
        self.passwordTextField.isUserInteractionEnabled = enabled
        self.continueButton.isUserInteractionEnabled = enabled
        self.backButton.isUserInteractionEnabled = enabled
        self.veil.isHidden = enabled
        self.whileIndicator.isHidden = enabled
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
