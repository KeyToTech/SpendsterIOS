//
//  AddExpencesView.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/12/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

protocol AddExpensesView {
    func enableUIInteraction()
    func disableUIInteraction()
    func showError(text: String)
    func goToHomeScreen()
}
