//
//  LoginMock.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/2/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

class MockLogin: LoginModel {
    func makeLogin(email: String, password: String) -> Single<User> {
        return Single<User>.create {single in
            single(.success(User(email: email, password: password)))
            return Disposables.create {}
        }
    }
}
