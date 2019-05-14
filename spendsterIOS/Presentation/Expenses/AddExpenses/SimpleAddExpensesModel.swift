//
//  AddExpensesModel.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/13/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import SwiftyJSON

class SimpleAddExpensesModel: AddExpensesModel {
    
    private let url = "https://spendsterapp.herokuapp.com/expenses/save"
    func addExpense(amount: Float, createdDate: String, categoryId: String, note: String) -> Single<Expense> {
        let header: HTTPHeaders = [
            "Authorization": "1234567890"
        ]
        // TODO
        // make token implementation of this
        //
        let parameters: Parameters = [
            "userId": "1234567rrr-8",
            "amount": amount,
            "note": note,
            "categoryId": categoryId
        ]
        return Single<Expense>.create {single in
            let request = Alamofire.request(self.url,
                                            method: .post,
                                            parameters: parameters,
                                            encoding: JSONEncoding.default,
                                            headers: header)
                .responseJSON { response in
                    print(response)
                    if let data = response.data,
                        let json = try? JSON(data: data),
                        let jsonData = try? json.rawData(),
                        let responseData = try? JSONDecoder().decode(ExpenseResponce.self, from: jsonData) {
                        let expense = Expense.init(amount: responseData.amount,
                                                   date: responseData.createdDate,
                                                   categoryId: responseData.categoryId,
                                                   note: responseData.note)
                        single(.success(expense))
                    } else if let error = response.error {
                        single(.error(error))
                    } else {
                        single(.error(CategoryError(message: "Can't add expence now")))
                    }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}

struct ExpenseResponce: Codable {
    let id: String
    let userId: String
    let amount: Float
    let note: String
    let categoryId: String
    let createdDate: String
}
