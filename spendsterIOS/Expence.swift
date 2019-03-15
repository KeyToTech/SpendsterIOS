//
//  Expence.swift
//  spendserIOS
//
//  Created by Dmytro Holovko on 3/12/19.
//  Copyright © 2019 Dmytro Holovko. All rights reserved.
//

import Foundation

class Expence {
    private let ID: Int
    private let amount: Float
    private let createdDate: Date
    init(id: Int, amount: Float, date: Date) {
        self.ID = id
        self.amount = amount
        self.createdDate = date
    }
}
