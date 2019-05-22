//
//  CategoryResponse.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/16/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

struct CategoryCodable: Codable {
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
