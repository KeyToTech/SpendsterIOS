//
//  MockActivityModel.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/21/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

class MockActivityModel: ActivityModel {
    let list = [ExpenseCodable(id: "12", userId: "12", amount: 20, note: "", categoryId: "1", createdDate: ""),
                ExpenseCodable(id: "13", userId: "12", amount: 12, note: "", categoryId: "1", createdDate: ""),
                ExpenseCodable(id: "14", userId: "12", amount: 24, note: "", categoryId: "2", createdDate: ""),
                ExpenseCodable(id: "15", userId: "12", amount: 55, note: "", categoryId: "2", createdDate: ""),
                ExpenseCodable(id: "16", userId: "12", amount: 26, note: "", categoryId: "1", createdDate: ""),
                ExpenseCodable(id: "17", userId: "12", amount: 20, note: "", categoryId: "3", createdDate: ""),
                ExpenseCodable(id: "18", userId: "12", amount: 100, note: "", categoryId: "4", createdDate: ""),
    ]
    func fetchExpenses() -> Single<[ExpenseCodable]> {
        return Single<[ExpenseCodable]>.create{single in
            single(.success(self.list))
            return Disposables.create {
                
            }
        }
    }
}
