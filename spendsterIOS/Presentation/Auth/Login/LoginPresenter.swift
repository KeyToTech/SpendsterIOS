//
//  LoginPresenter.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/2/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

class LoginPresenter {

    let view: AuthView
    let model: LoginModel
    
    init(model: LoginModel, view: AuthView) {
        self.view = view
        self.model = model
    }
    
    func login(email: String, password: String) {
        if !AuthValidator(textField: email).isEmailValid() {
            self.view.showError(message: "Incorrect form of e-mail, try again")
        } else if !AuthValidator(textField: password).isPasswordValid() {
            self.view.showError(message: "Incorrect form of password, try again")
        } else if model.makeLogin(email: email, password: password) {
            self.view.goToHomeScreen()
        } else {
            self.view.showError(message: "Your email/password combination does not match a Spendster account")
        }
    }
}
