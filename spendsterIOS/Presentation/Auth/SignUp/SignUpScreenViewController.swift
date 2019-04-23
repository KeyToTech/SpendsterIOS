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
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        errorMessage.isHidden = true
        presenter?.signUp(email: emailTextField.text!, password: passwordTextField.text!, rePassword: rePasswordTextField.text!)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
        self.rePasswordTextField.text = ""
        errorMessage.isHidden = true
        self.presenter = SignUpPresenter(model: SignUpModel(), view: self)
    }
}
