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
    private let url: String = APIManager.baseURL + APIManager.login
    func makeLogin(email: String, password: String) -> Single<UserCodable> {
        let parameters: Parameters = [
            "email": email, "password": password
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
