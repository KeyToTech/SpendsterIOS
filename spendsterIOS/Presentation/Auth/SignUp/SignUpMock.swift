//
//  SignUpMockUser.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/1/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

class SignUpMock: SignUpModel {
    func makeSingUp(email: String, password: String) -> Bool {
        return true
    }
}
