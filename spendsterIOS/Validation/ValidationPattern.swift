//
//  ValidationPattern.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/24/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
struct ValidationPattern {
    static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let password = "[A-Z0-9a-z._%+-]{8,24}"
    static let name = "[A-Za-z]+\\ [A-Za-z]{1,64}"
    static let phone = "[+][0-9]{10,15}"
    static let username = "[A-Z0-9a-z]{4,16}"
    static let amount = "[0-9]{1,12}"
}
