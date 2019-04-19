//
//  AddressScreenModel.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

protocol AddressScreenModel {
    func updateUser(name: String, phoneNumber: String) -> Single<User>
}
