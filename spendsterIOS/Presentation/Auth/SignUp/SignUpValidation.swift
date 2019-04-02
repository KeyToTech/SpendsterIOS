//
//  SignUpValidation.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 3/30/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

protocol SignUpValidation {
    func isEmailValid(email: String) -> Bool
    func isPasswordValid(password: String) -> Bool
    func isPasswordsMatch(password: String, rePassword: String) -> Bool
}
