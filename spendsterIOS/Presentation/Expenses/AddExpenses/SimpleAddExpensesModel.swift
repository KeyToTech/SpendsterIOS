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
    private let url: String = APIManager.baseURL + "/categories/save"
    func addExpense(amount: Float, createdDate: String, categoryId: String, note: String, userId: String) -> Single<Expense> {        
        return Single<Expense>.create {single in
            let request = AddExpenseRequest(amount: amount, createdDate: createdDate, categoryId: categoryId, note: note, userId: userId).request(url: self.url)
                .responseJSON { response in
                    if let data = response.data,
                        let responseData = try? JSONDecoder().decode(ExpenseCodable.self, from: data) {
                        let expense = Expense(amount: responseData.amount,
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
