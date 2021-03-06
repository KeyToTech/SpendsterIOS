//
//  MoreAboutUserPresenter.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/15/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import UIKit

class MoreAboutUserPresenter {
    private let view: MoreAboutScreenViewController
    private let storage: UserStorage
    init(view: MoreAboutScreenViewController, storage: UserStorage) {
        self.view = view
        self.storage = storage
    }
    
    func saveImage(image: UIImage) {
        self.storage.saveImage(image: image)
    }
}
