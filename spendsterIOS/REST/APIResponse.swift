//
//  APIResponse.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import Alamofire

protocol APIRequest {
    func request() -> DataRequest
    func parameters() -> Parameters?
    func headers() -> HTTPHeaders
}

extension APIRequest {
    func headers() -> HTTPHeaders {
        return [
            "Authorization": "1234567890"
            // TODO
            // make token implementation of this
            // https://trello.com/c/lOkWHXKt/150-token-implementation
        ]
    }
    
    func parameters() -> Parameters? {
        return nil
    }
}
