//
//  AddExpencesModelProtocol.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/12/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

protocol AddExpensesModel {
    func addExpense(amount: Float, createdDate: String, categoryId: String, note: String, userId: String) -> Single<Expense>
}
