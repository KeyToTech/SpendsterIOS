//
//  ExpenseResponce.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

struct ExpenseCodable: Codable {
    let id: String
    let userId: String
    let amount: Float
    let note: String
    let categoryId: String
    let createdDate: String
}
