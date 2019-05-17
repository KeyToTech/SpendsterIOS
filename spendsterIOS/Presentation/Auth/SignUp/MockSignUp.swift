//
//  SignUpMockUser.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/1/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

class MockSignUp: SignUpModel {
    func makeSingUp(email: String, username: String, password: String) -> Single<User> {
        return Single<User>.create {single in
            single(.success(User(email: email, password: password)))
            return Disposables.create {}
        }
    }
}
