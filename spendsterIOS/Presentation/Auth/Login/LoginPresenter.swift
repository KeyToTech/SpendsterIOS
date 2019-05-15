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
    let storage: UserStorage
    let disposeBag = DisposeBag()
    
    init(model: LoginModel, view: AuthView, storage: UserStorage) {
        self.view = view
        self.model = model
        self.storage = storage
    }
    
    func makeRecord() {
        UserDefaults.standard.set(true, forKey: "alreadyLoggedIn")
    }
    
    func login(email: String, password: String) {
        if !TextValidation(text: email, pattern: ValidationPattern.email).validate() {
            self.view.showError(withMessage: "Incorrect form of e-mail, try again")
        } else if !TextValidation(text: password, pattern: ValidationPattern.password).validate() {
            self.view.showError(withMessage: "Incorrect form of password, try again")
        } else {
            self.view.showLoading()
            self.model.makeLogin(email: email, password: password)
                .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
                .observeOn(MainScheduler.instance)
                .subscribe(onSuccess: { user in
                    self.storage.saveUser(user: user)
                    self.view.goToHomeScreen()
                    
                },
                           onError: { error in
                            self.view.hideLoading()
                            self.view.showError(withMessage: error.localizedDescription)
                })
                .disposed(by: disposeBag)
        }
    }
}
