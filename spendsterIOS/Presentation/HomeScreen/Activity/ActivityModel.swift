//
//  ActivityModel.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/21/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift
protocol ActivityModel {
    func fetchExpenses() -> Single<[ExpenseCodable]>
}
