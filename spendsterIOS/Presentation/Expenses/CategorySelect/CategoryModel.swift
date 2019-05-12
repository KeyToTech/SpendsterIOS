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

class CategoryModel: CategoryModelProtocol {
    private let url = "https://spendsterapp.herokuapp.com/categories"
    func fetchCategories() -> Single<[CategoryResponse]> {
        return Single<[CategoryResponse]>.create { single in
            let request = Alamofire.request(self.url,
                                            method: .get,
                                            encoding: JSONEncoding.default)
                .responseJSON { response in
                    print(response)
                    
                    if let data = response.data,
                        let json = try? JSON(data: data) {
                        let categories = self.deserialize(json: json)
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
    
    func deserialize(json: JSON) -> [CategoryResponse] {
        var list: [CategoryResponse] = []
        let decoder = JSONDecoder()
        for item in json.arrayValue {
            if let data = try? item.rawData() {
                if let responseData = try? decoder.decode(CategoryResponse.self, from: data) {
                    list.append(responseData)
                }
            }
        }
        return list
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
