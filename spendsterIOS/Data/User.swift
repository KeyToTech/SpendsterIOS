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
    private var password: String?
    private var balance: Float?
    let createdDate: Date?
    init(id: Int, username: String, email: String, password: String, balance: Float, date: Date) {
        self.ID = id
        self.username = username
        self.email = email
        self.password = password
        self.balance = balance
        self.createdDate = date
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
        self.ID = nil
        self.balance = nil
        self.username = nil
        self.createdDate = nil
    }
}
