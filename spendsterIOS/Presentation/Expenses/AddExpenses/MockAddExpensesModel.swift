//
//  MockAddExpencesModel.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/12/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

class MockAddExpensesModel: AddExpensesModel {
    func addExpense(amount: Float, createdDate: String, categoryId: String, note: String, userId: String) -> Single<Expense> {
        return Single<Expense>.create {single in
            let expence = Expense.init(amount: amount, date: createdDate, categoryId: categoryId, note: note)
            single(.success(expence))
            return Disposables.create {
                
            }
        }
    }
}
