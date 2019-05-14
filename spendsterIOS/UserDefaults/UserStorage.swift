//
//  UserStorage.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/14/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol UserStorage {
    func isUserExist() -> Bool
    func saveUser(user: UserCodable)
    func readUser() throws -> User
    func clear()
}
