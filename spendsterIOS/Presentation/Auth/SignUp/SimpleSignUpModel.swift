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

class SimpleSignUpModel: SignUpModel {
    private let url: String = APIManager.baseURL + APIManager.signUp
    func makeSingUp(email: String, username: String, password: String) -> Single<UserCodable> {
        let parameters: Parameters = [
            "username": username,
            "email": email,
            "password": password
        ]
        return Single<UserCodable>.create { single in
            let request = Alamofire.request(self.url,
                                            method: .post,
                                            parameters: parameters,
                                            encoding: JSONEncoding.default)
                .responseJSON { response in
                    print(response)
                    if let data = response.data,
                        let user = try? JSONDecoder().decode(UserCodable.self, from: data) {
                        single(.success(user))
                    } else if let error = response.error {
                        single(.error(error))
                    } else {
                        single(.error(SignUpError.init(message: "")))
                    }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}

struct SignUpError: Error {
    let message: String
}

struct UserCodable: Codable {
    let balance: Float
    let id: String
    let email: String
    let token: String
    let username: String
}
