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
    func makeLogin(email: String, password: String) -> Single<UserCodable> {
        return Single<UserCodable>.create { single in
            let request = LoginRequest(email: email,
                                       password: password)
                .request()
                .responseJSON { response in
                    if let data = response.data,
                        let user = try? JSONDecoder().decode(UserCodable.self, from: data) {
                        single(.success(user))
                    } else if let error = response.error {
                        single(.error(error))
                    } else {
                        single(.error(ResponseParseError(message: "You can't login now")))
                    }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
