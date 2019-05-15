//
//  ProfilePresenter.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/15/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

class ProfilePresenter {
    private let view: ProfileView
    private let storage: UserStorage
    init(view: ProfileView, storage: UserStorage) {
        self.view = view
        self.storage = storage
    }
    
    func makeLogout() {
        storage.clear()
    }
    
    func updeteProfile() {
        if let username = try? storage.readUser().userName {
            self.view.bindUsername(username: username)
        }
        if let email = try? storage.readUser().userEmail {
            self.view.bindEmail(email: email)
        }
        if let imageData = try? storage.readImageData() {
            self.view.bindImage(imageData: imageData)
        }
    }
}
