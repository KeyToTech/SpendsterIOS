//
//  Category.swift
//  spendserIOS
//
//  Created by Dmytro Holovko on 3/12/19.
//  Copyright © 2019 Dmytro Holovko. All rights reserved.
//

import Foundation

class Category {
    private let id: String
    private let name: String
    private let type: String
    private let icon: String
    private let createdDate: String
    
    var categoryName: String {get {return self.name}}
    var categoryId: String{get {return self.id}}
    
    init(id: String, name: String, type: String, icon: String, date: String) {
        self.id = id
        self.name = name
        self.type = type
        self.icon = icon
        self.createdDate = date
    }
}
