//
//  AuthView.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 3/30/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

protocol AuthView {
    func showError(message: String)
    func goToHomeScreen()
}
