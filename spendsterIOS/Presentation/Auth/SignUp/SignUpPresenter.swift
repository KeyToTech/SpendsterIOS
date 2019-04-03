//
//  SignUpPresenter.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 3/30/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

class SignUpPresenter {
    let model: SignUpModel
    let view: AuthView
    
    init(model: SignUpModel, view: AuthView) {
        self.model = model
        self.view = view
    }
    
//    func signUp(email: String, password: String, rePassword: String) {
//        if !isEmailValid(email: email) {
//            self.view.showError(message: "Incorrect form of e-mail, try again")
//        } else if !isPasswordValid(password: password) {
//            self.view.showError(message: "Incorrect form of password, try again")
//        } else if !isPasswordsMatch(password: password, rePassword: rePassword) {
//            self.view.showError(message: "Passwords don't match, try again")
//        } else if model.makeSingUp(email: email, password: password) {
//            self.view.goToHomeScreen()
//        }
//    }
    
    func signUp(email: String, password: String, rePassword: String) {
        if !AuthValidator(textField: email).isEmailValid() {
            self.view.showError(message: "Incorrect form of e-mail, try again")
        } else if !AuthValidator(textField: password).isPasswordValid() {
            self.view.showError(message: "Incorrect form of password, try again")
        } else if !(password == rePassword) {
            self.view.showError(message: "Passwords don't match, try again")
        } else {
            self.view.goToHomeScreen()
        }
    }
}
