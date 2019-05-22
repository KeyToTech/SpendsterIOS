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
    func makeSingUp(email: String, username: String, password: String) -> Single<UserCodable> {
        return Single<UserCodable>.create { single in
            let request = SignUpRequest(email: email,
                                        username: username,
                                        password: password)
                .request()
                .responseJSON { response in
                    if let data = response.data,
                        let user = try? JSONDecoder().decode(UserCodable.self, from: data) {
                        single(.success(user))
                    } else if let error = response.error {
                        single(.error(error))
                    } else {
                        single(.error(ResponseParseError(message: "You can't singn up now")))
                    }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
