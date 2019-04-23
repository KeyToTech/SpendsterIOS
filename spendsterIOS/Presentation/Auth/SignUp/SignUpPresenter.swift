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
    
    func signUp(email: String, username: String, password: String, rePassword: String) {
        if !TextValidation(text: email, pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").validate() {
            self.view.showError(message: "Incorrect form of e-mail, try again")
        } else if !TextValidation(text: username, pattern: "[A-Z0-9a-z]{4,16}").validate() {
            self.view.showError(message: "Incorrect form of username, try again")
        } else if !TextValidation(text: password, pattern: "[A-Z0-9a-z._%+-]{8,24}").validate() {
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
