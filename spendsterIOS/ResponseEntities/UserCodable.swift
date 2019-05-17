//
//  UserCodable.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

struct UserCodable: Codable {
    let balance: Float
    let id: String
    let email: String
    let token: String
    let username: String
}
