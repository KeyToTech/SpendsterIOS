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
    private let url: String = APIManager.baseURL + "/categories"
    func fetchCategories() -> Single<[CategoryCodable]> {
        return Single<[CategoryCodable]>.create { single in
            let request = CategoryListRequest().request(url: self.url)
                .responseJSON { response in
                    if let data = response.data,
                        let categories = try? JSONDecoder().decode([CategoryCodable].self, from: data) {
                        single(.success(categories))
                    } else if let error = response.error {
                        single(.error(error))
                    } else {
                        single(.error(CategoryError.init(message: "Can't load categories")))
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
