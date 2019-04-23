//
//  SignUpModel.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/23/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import SwiftyJSON

class SignUpModel: SignUpModelProtocol {
    func makeSingUp(email: String, password: String) -> Single<User> {
        let parameters: Parameters = [
            "username": email, "password": password
        ]
        return Single<User>.create { single in
            Alamofire.request("https://spendsterapp.herokuapp.com/login",
                              method: .post,
                              parameters: parameters,
                              encoding: JSONEncoding.default)
                .responseJSON { response in
                    print(response)
                    if let json = response.result.value as? JSON,
                        let data = try? json.rawData(),
                        let responseData = try? JSONDecoder().decode(SignUpResponse.self, from: data) {
                        
                        single(.success(User.init(balance: responseData.balance,
                                                  id: responseData.id,
                                                  password: responseData.password,
                                                  username: responseData.username)))
                    } else if let error = response.error {
                        single(.error(error))
                    } else {
                        single(.error(SignUpError.init(message: "")))
                    }
            }
            return Disposables.create {}
        }
    }
}

struct SignUpError: Error {
    let message: String
}

struct SignUpResponse: Codable {
    let balance: Float
    let id: Int
    let password: String
    let username: String
}
