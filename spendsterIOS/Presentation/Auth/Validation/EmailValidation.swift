//
//  EmailValidation.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/3/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

class EmailValidation: Validation {
    private let email: String
    
    init(email: String) {
        self.email = email
    }
    
    func validate() -> Bool {
        let format = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", format)
        return predicate.evaluate(with: self.email)
    }
}
