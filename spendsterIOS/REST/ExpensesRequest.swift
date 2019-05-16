//
//  ExpensesRequest.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import Alamofire

class AddExpenseRequest: APIRequest {
    private let amount: Float
    private let date: String
    private let categoryID: String
    private let note: String
    private let userId: String
    
    init(amount: Float, createdDate: String, categoryId: String, note: String, userId: String) {
        self.amount = amount
        self.date = createdDate
        self.categoryID = categoryId
        self.note = note
        self.userId = userId
    }
    
    func request(url: String) -> DataRequest {
        return Alamofire.request(url,
                                 method: .post,
                                 parameters: self.parameters(),
                                 encoding: JSONEncoding.default,
                                 headers: self.headers())
    }
    
    func parameters() -> Parameters? {
        return [
            "userId": self.userId,
            "amount": self.amount,
            "note": self.note,
            "categoryId": self.categoryID
        ]
    }
}
