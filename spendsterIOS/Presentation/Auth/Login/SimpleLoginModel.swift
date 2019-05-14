//
//  LoginModel.swift
//  
//
//  Created by Dmytro Holovko on 4/23/19.
//

import Foundation
import Alamofire
import RxSwift
import SwiftyJSON

class SimpleLoginModel: LoginModel {
    func makeLogin(email: String, password: String) -> Single<User> {
        let parameters: Parameters = [
            "email": email, "password": password
        ]
        return Single<User>.create { single in
            let request = Alamofire.request("https://spendsterapp.herokuapp.com/login",
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
                                                  email: responseData.email)))
                    } else if let error = response.error {
                        single(.error(error))
                    } else {
                        single(.error(LoginError.init(message: "You can't login now")))
                    }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}

struct LoginError: Error {
    let message: String
}

struct LoginResponse: Codable {
    let balance: Float
    let id: Int
    let password: String
    let email: String
}
