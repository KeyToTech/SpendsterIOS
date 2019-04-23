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
    let model: SignUpModelProtocol
    let view: AuthView
    
    init(model: SignUpModelProtocol, view: AuthView) {
        self.model = model
        self.view = view
    }

    func makeRecord() {
        UserDefaults.standard.set(true, forKey: "alreadyLoggedIn")
    }
    
    func signUp(email: String, password: String, rePassword: String) {
        if !EmailValidation(email: email).validate() {
            self.view.showError(message: "Incorrect form of e-mail, try again")
        } else if !PasswordValidation(password: password).validate() {
            self.view.showError(message: "Incorrect form of password, try again")
        } else if !(password == rePassword) {
            self.view.showError(message: "Passwords don't match, try again")
        } else {
            model.makeSingUp(email: email, password: password)
                .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
                .observeOn(MainScheduler.instance)
                .subscribe { user in
                    if user != nil {
                        self.makeRecord()
                        self.view.goToHomeScreen()
                    } else {
                        self.view.showError(message: "You can't login now")
                    }
                }
                .disposed(by: disposeBag)
        }
    }
}
