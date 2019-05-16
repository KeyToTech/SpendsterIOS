//
//  LoginRequest.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import Alamofire

class LoginRequest: APIRequest {
    private let email: String
    private let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func request(url: String) -> DataRequest {
        return Alamofire.request(url,
                                 method: .post,
                                 parameters: self.parameters(),
                                 encoding: JSONEncoding.default)
    }
    
    func parameters() -> Parameters? {
        return [
            "email": self.email,
            "password": self.password
        ]
    }
}
