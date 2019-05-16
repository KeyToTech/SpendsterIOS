//
//  CustomPagingView.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/17/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
///Users/dmytroholovko/Developer/spendsterIOS/Pods/Parchment/Parchment/Enums/PagingMenuItemSize.swift:14:3: 'public' modifier is redundant for property declared in a public extension

import Foundation
import Parchment

class CustomPagingView: PagingView {
    
    override func setupConstraints() {
        // Use our convenience extension to constrain the page view to all
        // of the edges of the super view.
        constrainToEdges(pageView)
    }
}
