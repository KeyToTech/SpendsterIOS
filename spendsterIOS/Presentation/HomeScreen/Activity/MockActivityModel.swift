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
    func fetchExpenses() -> Single<[ExpenseCodable]> {
        return Single<[ExpenseCodable]>.create {single in
            let expenses: [ExpenseCodable] = [ExpenseCodable(id: "12", userId: "12", amount: 100, note: "Condo rent monthly fee", categoryId: "1", createdDate: ""),
                            ExpenseCodable(id: "13", userId: "12", amount: 12, note: "Elegant men shoes", categoryId: "1", createdDate: ""),
                            ExpenseCodable(id: "14", userId: "12", amount: 24, note: "UI Design Course", categoryId: "2", createdDate: ""),
                            ExpenseCodable(id: "15", userId: "12", amount: 55, note: "Internet Subscription", categoryId: "2", createdDate: ""),
                            ExpenseCodable(id: "16", userId: "12", amount: 26, note: "Monthly Remuneration", categoryId: "1", createdDate: ""),
                            ExpenseCodable(id: "17", userId: "12", amount: 20, note: "Fitness Subscription", categoryId: "3", createdDate: ""),
                            ExpenseCodable(id: "18", userId: "12", amount: 100, note: "Monthly fee", categoryId: "4", createdDate: "")]
            single(.success(expenses))
            return Disposables.create {
                
            }
        }
    }
}
