//
//  UserDefaultsStorage.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/14/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserDefaultsStorage {
    static let defaults = UserDefaults.standard
    static let userKey = "userkey"
    static let tokenKey = "tokenkey"
    
    class func isUserExist() -> Bool {
        var result = true
        do {
            try _ = self.readUser()
        } catch {
            result = false
        }
        return result
    }

    class func saveUser(user: UserCodable) {
        if let data: Data = try? JSONEncoder().encode(user) {
            self.defaults.set(data, forKey: self.userKey)
        }
    }

    class func readUser() throws -> User {
        if let data = defaults.value(forKey: self.userKey) as? Data,
            let decoded = try? JSONDecoder().decode(UserCodable.self, from: data) {
            let user = User.init(balance: decoded.balance,
                                 id: decoded.id,
                                 username: decoded.username,
                                 email: decoded.email,
                                 token: decoded.token)
            return user
        } else {
            throw UserExsistError(message: "no user in storage")
        }
    }

    class func clear() {
        self.defaults.removeObject(forKey: self.userKey)
    }
    
}

struct UserExsistError: Error {
    let message: String
}
