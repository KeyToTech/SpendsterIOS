//
//  CategoryRepository.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/11/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

class CategoryRepository {
    var categories: [Category] = []
    
    func applyCategories(categories: [CategoryCodable]) {
        categories.forEach { (item) in
            self.categories.append(Category.init(id: item.id,
                                                 name: item.name,
                                                 type: item.type,
                                                 icon: item.icon,
                                                 date: item.createdDate))
        }
    }
}
