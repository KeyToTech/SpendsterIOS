//
//  LoginMock.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/2/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

class LoginMock: LoginModel {
    func makeLogin(email: String, password: String) -> Bool {
        return true
    }
}
