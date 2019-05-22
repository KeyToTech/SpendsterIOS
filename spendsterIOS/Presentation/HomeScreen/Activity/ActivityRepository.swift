//
//  ActivityRepository.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/21/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

class ActivityRepository {
    var expenses: [Expense] = []
    
    func applyExpenses(expenses: [ExpenseCodable]) {
        expenses.forEach { (item) in
            self.expenses.append(Expense(id: item.id, amount: item.amount, date: item.createdDate, categoryId: item.categoryId, note: item.note))
        }
    }
}
