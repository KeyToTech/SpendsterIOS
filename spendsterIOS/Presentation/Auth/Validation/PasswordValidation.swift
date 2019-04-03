//
//  PasswordValidation.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/3/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
class PasswordValidation: Validation {
    private let password: String
    
    init(password: String) {
        self.password = password
    }
    
    func validate() -> Bool {
        let format = "[A-Z0-9a-z._%+-]{8,24}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", format)
        return predicate.evaluate(with: self.password)
    }
}
