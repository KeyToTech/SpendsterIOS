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
    private let url: String = APIManager.baseURL + "/signup"
    func makeSingUp(email: String, username: String, password: String) -> Single<UserCodable> {
        return Single<UserCodable>.create { single in
            let request = SignUpRequest(email: email,
                                        username: username,
                                        password: password)
                .request(url: self.url)
                .responseJSON { response in
                    if let data = response.data,
                        let user = try? JSONDecoder().decode(UserCodable.self, from: data) {
                        single(.success(user))
                    } else if let error = response.error {
                        single(.error(error))
                    } else {
                        single(.error(SignUpError.init(message: "You can't login now")))
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
