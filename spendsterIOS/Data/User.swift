//
//  User.swift
//  spendserIOS
//
//  Created by Dmytro Holovko on 3/12/19.
//  Copyright © 2019 Dmytro Holovko. All rights reserved.
//

import Foundation

class User {
    private let ID: String?
    private let username: String?
    private let email: String?
    private let phone: String?
    private let name: String?
    private let password: String?
    private let balance: Float?
    private let createdDate: Date?
    private let token: String?
    public var userName: String? {get {return self.username}}
    public var userEmail: String? {get {return self.email}}
    public var userId: String? {get {return self.ID}}
    init(id: String?, username: String?, email: String?, password: String?, balance: Float?, date: Date?, name: String?, phone: String?, token: String?) {
        self.ID = id
        self.username = username
        self.email = email
        self.password = password
        self.balance = balance
        self.createdDate = date
        self.name = name
        self.phone  = phone
        self.token = token
    }
    
    convenience init(email: String, password: String) {
        self.init(id: nil, username: nil, email: email, password: password, balance: nil, date: nil, name: nil, phone: nil, token: nil)
    }
    
    convenience init(name: String, phone: String) {
        self.init(id: nil, username: nil, email: nil, password: nil, balance: nil, date: nil, name: name, phone: phone, token: nil)
    }
    
    convenience init(balance: Float, id: String, username: String, email: String, token: String) {
        self.init(id: id, username: username, email: email, password: nil, balance: balance, date: nil, name: nil, phone: nil, token: token)
    }
}
