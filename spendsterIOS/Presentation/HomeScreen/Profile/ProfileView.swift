//
//  ProfileView.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/15/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

protocol ProfileView {
    func bindUsername(username: String)
    func bindEmail(email: String)
    func bindImage(imageData: Data)
}
