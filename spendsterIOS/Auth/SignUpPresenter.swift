//
//  SignUpPresenter.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 3/30/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

class SignUpPresenter: SignUpValidation {
    let model: SignUpModel
    let view: AuthView
    init(model: SignUpModel, view: AuthView) {
        self.model = model
        self.view = view
    }
    
    func signUp(email: String, password: String, rePassword: String) {
        if !isEmailValid(email: email) {
            self.view.showError(message: "Incorrect form of e-mail, try again")
        } else if !isPasswordValid(password: password) {
            self.view.showError(message: "Incorrect form of password, try again")
        } else if !isPasswordsMatch(password: password, rePassword: rePassword) {
            self.view.showError(message: "Passwords don't match, try again")
        } else if model.makeSingUp(email: email, password: password) {
            self.view.goToHomeScreen()
        }
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
    
    func isPasswordsMatch(password: String, rePassword: String) -> Bool {
        return password == rePassword
    }
}
