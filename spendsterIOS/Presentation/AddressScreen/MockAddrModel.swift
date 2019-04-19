//
//  MockAddrModel.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

class MockAddrModel: AddressScreenModel {
    func updateUser(name: String, phoneNumber: String) -> Single<User> {
        return Single<User>.create {single in
            single(.success(User(name: name, phone: phoneNumber)))
            return Disposables.create {}
        }
    }
}
