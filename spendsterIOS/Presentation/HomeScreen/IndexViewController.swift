//
//  IndexViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/17/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController {
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    init(index: Int) {
        super.init(nibName: nil, bundle: nil)
        title = "\(months[index]) 2019"
        
        let image = UIImage(named: "Graphic")
        let imageView = UIImageView(image: image!)
        let emptyView = UIView()
        let emptyViewHeader = UILabel()
        let emptyViewText = UILabel()
        
        emptyViewHeader.text = "You don’t have any transactions\nright now, but you can"
        emptyViewText.text = " Start adding one by pressing\nthe plus icon from the bottom menu"
        
        emptyView.addSubview(emptyViewHeader)
        emptyView.addSubview(imageView)
        emptyView.constrainCentered(imageView)
        emptyView.addSubview(emptyViewText)
        emptyView.backgroundColor = .white
        
        view.addSubview(emptyView)
        view.constrainCentered(emptyView)
        view.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 254/255, alpha: 1)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
