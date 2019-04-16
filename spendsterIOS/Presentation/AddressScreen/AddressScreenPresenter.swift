//
//  AddressScreenPresenter.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

class AddressScreenPresenter {
    let view: AuthView
    let model: AddressScreenModel
    let disposeBag = DisposeBag()
    
    init(view: AuthView, model: AddressScreenModel) {
        self.view = view
        self.model = model
    }
    
    func makeUpdate(name: String, phoneNumber: String) {
        if !NameValidation(name: name).validate() {
            self.view.showError(message: "Invalid name format")
        } else if !PhoneNumberValidation(phoneNumber: phoneNumber).validate() {
            self.view.showError(message: "Invalid number format")
        } else {
            self.model.updateUser(name: name, phoneNumber: phoneNumber)
                .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
                .observeOn(MainScheduler.instance)
                .subscribe { user in
                    if user != nil {
                        self.view.goToHomeScreen()
                    } else {
                        self.view.showError(message: "You can't update your info now")
                    }
                }
                .disposed(by: disposeBag)
        }
    }
}
