//
//  CategoryModelProtocol.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/10/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

protocol CategoryModelProtocol {
    func fetchCategories() -> Single<[CategoryResponse]>
}
