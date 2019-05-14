//
//  AddExpencesPresenter.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/12/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

class AddExpensesPresenter {
    private let bag = DisposeBag()
    private let view: AddExpensesView
    private let model: AddExpensesModel
    init(view: AddExpensesView, model: AddExpensesModel) {
        self.view = view
        self.model = model
    }
    
    func addExpence(amount: String, createdDate: String, categoryId: String?, note: String) {
        if categoryId != nil {
            if !TextValidation(text: amount, pattern: ValidationPattern.amount).validate() {
                self.view.showError(text: "Incorrect form of amount, try again")
            } else {
                self.view.disableUIInteraction()
                self.model.addExpense(amount: (amount as NSString).floatValue, createdDate: createdDate, categoryId: categoryId!, note: note)
                    .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
                    .observeOn(MainScheduler.instance)
                    .subscribe(onSuccess: {categories in
                        self.view.enableUIInteraction()
                        self.view.goToHomeScreen()},
                               onError: {error in
                        self.view.enableUIInteraction()
                        self.view.showError(text: error.localizedDescription)
                    })
                    .disposed(by: bag)
            }
        } else {
            self.view.showError(text: "Category hasn't been chosed yet")
        }
    }
}
