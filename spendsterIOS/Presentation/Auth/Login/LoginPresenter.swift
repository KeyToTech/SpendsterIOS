//
//  LoginPresenter.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/2/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

class LoginPresenter: LoginValidation {

    let view: AuthView
    let model: LoginModel
    
    init(model: LoginModel, view: AuthView) {
        self.view = view
        self.model = model
    }
    
    func login(email: String, password: String) {
        if !isEmailValid(email: email) {
            self.view.showError(message: "Incorrect form of e-mail, try again")
        } else if !isPasswordValid(password: password) {
            self.view.showError(message: "Incorrect form of password, try again")
        } else if model.makeLogin(email: email, password: password) {
            self.view.goToHomeScreen()
        } else {view.showError(message: "Your email/password combination does not match a Spendster account")}
    }
    
    func isEmailValid(email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        let passwordFormat = "[A-Z0-9a-z._%+-]{8,24}"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
        return passwordPredicate.evaluate(with: password)
    }
}
