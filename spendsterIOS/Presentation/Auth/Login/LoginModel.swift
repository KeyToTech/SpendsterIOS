//
//  LoginModel.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/2/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

protocol LoginModel {
    func makeLogin(email: String, password: String) -> Single<UserCodable>
}
