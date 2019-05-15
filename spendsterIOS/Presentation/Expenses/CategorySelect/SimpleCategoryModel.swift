//
//  CategoryModel.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/10/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import SwiftyJSON

class SimpleCategoryModel: CategoryModel {
    private let url: String = APIManager.baseURL + APIManager.getCategories
    let headers: HTTPHeaders = [
        "Authorization": "1234567890"
    ]
    // TODO
    // make token implementation of this
    //
    func fetchCategories() -> Single<[CategoryResponse]> {
        return Single<[CategoryResponse]>.create { single in
            let request = Alamofire.request(self.url,
                                            method: .get,
                                            encoding: JSONEncoding.default,
                                            headers: self.headers)
                .responseJSON { response in
                    print(response)
                    
                    if let data = response.data,
                        let categories = try? JSONDecoder().decode([CategoryResponse].self, from: data) {
                        single(.success(categories))
                    } else if let error = response.error {
                        single(.error(error))
                    } else {
                        single(.error(CategoryError.init(message: "")))
                    }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}

struct CategoryError: Error {
    let message: String
}

struct CategoryResponse: Codable {
    let createdDate: String
    let icon: String
    let id: String
    let name: String
    let type: String
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(String.self, forKey: .type)
        icon = try container.decode(String.self, forKey: .icon)
        createdDate = try container.decode(String.self, forKey: .createdDate)
        
    }
}
