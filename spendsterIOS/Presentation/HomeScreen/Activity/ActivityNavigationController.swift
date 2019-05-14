//
//  ActivityNavigationController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/17/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import UIKit
protocol ActivityNavigationControllerDelegate: class {
    func didUpdatePageHeading()
}

class ActivityNavigationController: UINavigationController {
    weak var activityDelegate: ActivityNavigationControllerDelegate?
    override func viewDidAppear(_ animated: Bool) {
        activityDelegate?.didUpdatePageHeading()
    }
}
