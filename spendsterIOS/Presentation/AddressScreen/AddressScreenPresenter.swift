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
        if !TextValidation(text: name, pattern: ValidationPattern.name).validate() {
            self.view.showError(withMessage: "Invalid name format")
        } else if !TextValidation(text: phoneNumber, pattern: ValidationPattern.phone).validate() {
            self.view.showError(withMessage: "Invalid number format")
        } else {
            self.view.showLoading()
            self.model.updateUser(name: name, phoneNumber: phoneNumber)
                .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
                .observeOn(MainScheduler.instance)
                .subscribe { user in
                    if user != nil {
                        self.view.hideLoading()
                        self.view.goToHomeScreen()
                    } else {
                        self.view.hideLoading()
                        self.view.showError(withMessage: "You can't update your info now")
                    }
                }
                .disposed(by: disposeBag)
        }
    }
}
