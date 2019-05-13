//
//  MockAddExpencesModel.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/12/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

class MockAddExpencesModel: AddExpencesModelProtocol {
    func addExpense(amount: Float, createdDate: String, categoryId: String, note: String) -> Single<Expence> {
        return Single<Expence>.create {single in
            let expence = Expence.init(amount: amount, date: createdDate, categoryId: categoryId, note: note)
            single(.success(expence))
            return Disposables.create {
                
            }
        }
    }
}

