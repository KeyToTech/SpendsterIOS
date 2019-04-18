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
    private let view: AuthView
    private let model: AddressScreenModel
    private let disposeBag = DisposeBag()
    
    init(view: AuthView, model: AddressScreenModel) {
        self.view = view
        self.model = model
    }
    
    func makeUpdate(name: String, phoneNumber: String) {
        if !TextFiedValidation(text: name, pattern: "[A-Za-z]+\\ [A-Za-z]{1,64}").validate() {
            self.view.showError(message: "Invalid name format")
        } else if !TextFiedValidation(text: phoneNumber, pattern: "[+]+[0-9]{12}").validate() {
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
