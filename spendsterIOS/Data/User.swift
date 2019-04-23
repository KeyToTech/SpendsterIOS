//
//  User.swift
//  spendserIOS
//
//  Created by Dmytro Holovko on 3/12/19.
//  Copyright © 2019 Dmytro Holovko. All rights reserved.
//

import Foundation

class User {
    private let ID: Int?
    private let username: String?
    private let email: String?
    private let phone: String?
    private let name: String?
    private let password: String?
    private let balance: Float?
    private let createdDate: Date?
    
    init(id: Int?, username: String?, email: String?, password: String?, balance: Float?, date: Date?, name: String?, phone: String?) {
        self.ID = id
        self.username = username
        self.email = email
        self.password = password
        self.balance = balance
        self.createdDate = date
        self.name = name
        self.phone  = phone
    }
    
    convenience init(email: String, password: String) {
        self.init(id: nil, username: nil, email: email, password: password, balance: nil, date: nil, name: nil, phone: nil)
    }
    
    convenience init(name: String, phone: String) {
        self.init(id: nil, username: nil, email: nil, password: nil, balance: nil, date: nil, name: name, phone: phone)
    }
    
    convenience init(balance: Float, id: Int, password: String, username: String) {
        self.init(id: id, username: username, email: nil, password: password, balance: balance, date: nil, name: nil, phone: nil)
    }
}
