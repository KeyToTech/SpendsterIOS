//
//  ActivityPresenter.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/21/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

class ActivityPresenter {
    private let view: ActivityView
    private let model: ActivityModel
    private let repository: ActivityRepository
    private let bag = DisposeBag()
    init(view: ActivityView, model: ActivityModel, repository: ActivityRepository) {
        self.view = view
        self.model = model
        self.repository = repository
    }
    
    func presentCategories() {
        self.model.fetchExpenses()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: {expenses in
                self.repository.applyExpenses(expenses: expenses)
                self.view.reloadData()
            },
                       onError: { error in
                        print(error.localizedDescription)
            })
            .disposed(by: bag)
    }
    
    func expenses() -> [Expense] {
        return self.repository.expenses
    }
    
    func expense(forIndex index: Int) -> Expense {
        return self.repository.expenses[index]
    }
}
