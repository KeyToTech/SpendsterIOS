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
    func request(url: String) -> DataRequest {
        return Alamofire.request(url,
                                 method: .get,
                                 encoding: JSONEncoding.default,
                                 headers: self.headers())
    }
}
