//
//  UserDefaultsStorage.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/14/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserDefaultsStorage: UserStorage {
    private let defaults = UserDefaults.standard
    private let userKey = "userkey"
    private let imageKey = "profileImage"
    
    func readImageData() throws -> Data {
        if let imageData = defaults.value(forKey: imageKey) as? Data {
            return imageData
        } else {
        throw UserExsistError(message: "no user in storage")
        }
    }
    
    func saveImage(image: UIImage) {
        defaults.set(image.jpegData(compressionQuality: 0.75), forKey: imageKey)    }
    
    func isUserExist() -> Bool {
        var result = true
        do {
            try _ = self.readUser()
        } catch {
            result = false
        }
        return result
    }

    func saveUser(user: UserCodable) {
        if let data: Data = try? JSONEncoder().encode(user) {
            self.defaults.set(data, forKey: self.userKey)
        }
    }

    func readUser() throws -> User {
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

    func clear() {
        self.defaults.removeObject(forKey: self.userKey)
        UserDefaults.standard.removeObject(forKey: imageKey)
    }
    
}

struct UserExsistError: Error {
    let message: String
}
