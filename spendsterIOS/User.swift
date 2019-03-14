//
//  User.swift
//  spendserIOS
//
//  Created by Dmytro Holovko on 3/12/19.
//  Copyright © 2019 Dmytro Holovko. All rights reserved.
//

import Foundation

class User {
    let ID : Int
    var username : String
    var password : String
    var balance : Float
    let createdDate : Date
    
    init(id : Int, username : String, password : String, balance : Float, date : Date) {
        self.ID = id
        self.username = username
        self.password = password
        self.balance = balance
        self.createdDate = date
    }
}
