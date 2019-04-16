//
//  PhoneNumberValidation.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

class PhoneNumberValidation: Validation {
    private let phoneNumber: String
    
    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
    
    func validate() -> Bool {
        let format = "[+]{1}+[0-9]{12}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", format)
        return predicate.evaluate(with: self.phoneNumber)
    }
}
