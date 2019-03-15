//
//  Category.swift
//  spendserIOS
//
//  Created by Dmytro Holovko on 3/12/19.
//  Copyright © 2019 Dmytro Holovko. All rights reserved.
//

import Foundation

class Category {
    private let ID: Int
    private let name: String
    private let type: Bool
    private let createdDate: Date
    init(id: Int, name: String, type: Bool, date: Date) {
        self.ID = id
        self.name = name
        self.type = type
        self.createdDate = date
    }
}
