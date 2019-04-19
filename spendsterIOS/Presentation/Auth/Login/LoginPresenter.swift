//
//  LoginPresenter.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/2/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

class LoginPresenter {

    let view: AuthView
    let model: LoginModel
    let disposeBag = DisposeBag()
    
    init(model: LoginModel, view: AuthView) {
        self.view = view
        self.model = model
    }
    
    func makeRecord() {
        UserDefaults.standard.set(true, forKey: "alreadyLoggedIn")
    }
    
    func login(email: String, password: String) {
        if !EmailValidation(email: email).validate() {
            self.view.showError(message: "Incorrect form of e-mail, try again")
        } else if !PasswordValidation(password: password).validate() {
            self.view.showError(message: "Incorrect form of password, try again")
        } else {
            model.makeLogin(email: email, password: password)
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
