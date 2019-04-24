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
    let model: LoginModelProtocol
    let disposeBag = DisposeBag()
    
    init(model: LoginModelProtocol, view: AuthView) {
        self.view = view
        self.model = model
    }
    
    func makeRecord() {
        UserDefaults.standard.set(true, forKey: "alreadyLoggedIn")
    }
    
    func login(email: String, password: String) {
        if !TextValidation(text: email, pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").validate() {
            self.view.showError(message: "Incorrect form of e-mail, try again")
        } else if !TextValidation(text: password, pattern: "[A-Z0-9a-z._%+-]{8,24}").validate() {
            self.view.showError(message: "Incorrect form of password, try again")
        } else {
            self.view.disableUIInteraction()
            self.model.makeLogin(email: email, password: password)
                .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
                .observeOn(MainScheduler.instance)
                .subscribe { user in
                    if user != nil {
                        self.makeRecord()
                        self.view.goToHomeScreen()
                    } else {
                        self.view.enableUIInteraction()
                        self.view.showError(message: "You can't login now")
                    }
                }
                .disposed(by: disposeBag)
        }
    }
}
