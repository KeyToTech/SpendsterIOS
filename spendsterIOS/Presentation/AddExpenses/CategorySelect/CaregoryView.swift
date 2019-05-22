//
//  CaregoryView.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/10/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation

protocol CategoryView: ErrorView, LoadingView {
    func reloadData()
}
