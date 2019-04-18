//
//  NameValidation.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

class TextFiedValidation: Validation {
    private let text: String
    private let pattern: String
    init (text: String, pattern: String) {
        self.text = text
        self.pattern = pattern
    }
    
    func validate() -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", self.pattern).evaluate(with: self.text)
    }
}
