//
//  AuthValidator.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/3/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

class AuthValidator {
    let textField: String
    
    init(textField: String) {
        self.textField = textField
    }
    
    func isEmailValid() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self.textField)
    }
    
    func isPasswordValid() -> Bool {
        let passwordFormat = "[A-Z0-9a-z._%+-]{8,24}"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
        return passwordPredicate.evaluate(with: self.textField)
    }
    
    
}
