//
//  SignUpPresenter.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 3/30/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

class SignUpPresenter {
    let disposeBag = DisposeBag()
    let model: SignUpModel
    let view: AuthView
    
    init(model: SignUpModel, view: AuthView) {
        self.model = model
        self.view = view
    }

    func makeRecord() {
        UserDefaults.standard.set(true, forKey: "alreadyLoggedIn")
    }
    
    func signUp(email: String, username: String, password: String, rePassword: String) {
        if !TextValidation(text: email, pattern: ValidationPattern.email).validate() {
            self.view.showError(withMessage: "Incorrect form of e-mail, try again")
        } else if !TextValidation(text: username, pattern: ValidationPattern.username).validate() {
            self.view.showError(withMessage: "Incorrect form of username, try again")
        } else if !TextValidation(text: password, pattern: ValidationPattern.password).validate() {
            self.view.showError(withMessage: "Incorrect form of password, try again")
        } else if !(password == rePassword) {
            self.view.showError(withMessage: "Passwords don't match, try again")
        } else {
            self.view.showLoading()
            self.model.makeSingUp(email: email, username: username, password: password)
                .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
                .observeOn(MainScheduler.instance)
                .subscribe { user in
                    if user != nil {
                        self.makeRecord()
                        self.view.goToHomeScreen()
                    } else {
                        self.view.hideLoading()
                        self.view.showError(withMessage: "You can't login now")
                    }
                }
                .disposed(by: disposeBag)
        }
    }
}
