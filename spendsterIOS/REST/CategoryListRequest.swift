//
//  CategoryListRequest.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import Alamofire

class CategoryListRequest: APIRequest {
    private let url: String = APIManager.baseURL + "/categories"
    func request() -> DataRequest {
        return Alamofire.request(self.url,
                                 method: .get,
                                 encoding: JSONEncoding.default,
                                 headers: self.headers())
    }
}
