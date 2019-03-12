//
//  Income.swift
//  spendserIOS
//
//  Created by Dmytro Holovko on 3/12/19.
//  Copyright © 2019 Dmytro Holovko. All rights reserved.
//

import Foundation

class Income {
    let ID : Int
    let amount : Float
    let createdDate : Date
    
    init(id : Int, amount : Float, date : Date) {
        self.ID = id
        self.amount = amount
        self.createdDate = date
    }
}
