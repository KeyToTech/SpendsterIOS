//
//  LoginValidation.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/2/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

protocol LoginValidation {
    func isEmailValid(email: String) -> Bool
    func isPasswordValid(password: String) -> Bool
}
