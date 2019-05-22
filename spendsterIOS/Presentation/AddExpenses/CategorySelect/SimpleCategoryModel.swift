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
    func fetchCategories() -> Single<[CategoryCodable]> {
        return Single<[CategoryCodable]>.create { single in
            let request = CategoryListRequest()
                .request()
                .responseJSON { response in
                    if let data = response.data,
                        let categories = try? JSONDecoder().decode([CategoryCodable].self, from: data) {
                        single(.success(categories))
                    } else if let error = response.error {
                        single(.error(error))
                    } else {
                        single(.error(ResponseParseError(message: "Can't load categories")))
                    }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
