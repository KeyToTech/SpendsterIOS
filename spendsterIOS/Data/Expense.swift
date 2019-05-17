//
//  Expence.swift
//  spendserIOS
//
//  Created by Dmytro Holovko on 3/12/19.
//  Copyright © 2019 Dmytro Holovko. All rights reserved.
//

import Foundation

class Expense {
    private let id: String?
    private let amount: Float
    private let createdDate: String
    private let categoryId: String
    private let note: String
    init(id: String?, amount: Float, date: String, categoryId: String, note: String) {
        self.id = id
        self.amount = amount
        self.createdDate = date
        self.categoryId = categoryId
        self.note = note
    }
    
    convenience init(amount: Float, date: String, categoryId: String, note: String) {
        self.init(id: nil, amount: amount, date: date, categoryId: categoryId, note: note)
    }
}
