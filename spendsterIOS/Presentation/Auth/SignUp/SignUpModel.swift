//
//  SignUpModel.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 3/30/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

protocol SignUpModel {
    func makeSingUp(email: String, username: String, password: String) -> Single<User>
}
