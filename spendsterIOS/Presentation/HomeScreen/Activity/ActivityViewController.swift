//
//  ActivityViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/17/19.
//  Copyright © 2019 KeyToTech. All rights reserved.

import UIKit
import Parchment

class ActivityViewController: UIViewController {
    
    let pagingViewController = CustomPagingViewController(viewControllers: [IndexViewController(index: 0),
                                                                           IndexViewController(index: 1),
                                                                           IndexViewController(index: 2),
                                                                           IndexViewController(index: 3),
                                                                           IndexViewController(index: 4)])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pagingViewController.borderOptions = .hidden
        pagingViewController.menuBackgroundColor = .clear
        pagingViewController.indicatorColor = UIColor(red: 49/255, green: 209/255, blue: 158/255, alpha: 1)
        pagingViewController.textColor = .lightGray
        pagingViewController.selectedTextColor = UIColor.black
        pagingViewController.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin)
        pagingViewController.selectedFont = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        navigationItem.titleView = pagingViewController.collectionView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationItem.titleView?.frame = CGRect(origin: .zero, size: navigationBar.bounds.size)
        pagingViewController.menuItemSize = .fixed(width: 150, height: navigationBar.bounds.height)
    }
    
}
