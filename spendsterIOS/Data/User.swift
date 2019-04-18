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
    private var password: String?
    private var balance: Float?
    private let createdDate: Date?
    init(id: Int, username: String, email: String, password: String, balance: Float, date: Date, name: String, phone: String) {
        self.ID = id
        self.username = username
        self.email = email
        self.password = password
        self.balance = balance
        self.createdDate = date
        self.name = name
        self.phone  = phone
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
        self.ID = nil
        self.balance = nil
        self.username = nil
        self.createdDate = nil
        self.name = nil
        self.phone  = nil
    }
    
    init(name: String, phone: String) {
        self.name = name
        self.phone  = phone
        self.email = nil
        self.password = nil
        self.ID = nil
        self.balance = nil
        self.username = nil
        self.createdDate = nil
    }
}
