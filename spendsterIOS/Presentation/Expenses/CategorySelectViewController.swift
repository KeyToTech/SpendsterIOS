//
//  CategorySelectViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/8/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//  swiftlint:disable force_cast

import UIKit

class CategorySelectViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var array = ["First Category", "Second Category", "Third Category", "Fourth Category", "Fifth Category", "Category", "Category", "Category", "blabla", "dfgdfg", "Education", "FUCK GG", "First Category", "Second Category", "Third Category", "Fourth Category", "Fifth Category", "Category", "Category", "Category", "blabla", "dfgdfg", "Education", "FUCK GG"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellView", for: indexPath) as! CollectionViewCell
        cell.categoryImage.image = UIImage(named: "Calendar-for-light-theme")
        cell.categoryLabel.text = array[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.cellTapped(_:)))
        self.collectionView.addGestureRecognizer(tap)
    }
    
    @objc func cellTapped(_ sender: UITapGestureRecognizer) {
        if let indexPath = self.collectionView.indexPathForItem(at: sender.location(in: self.collectionView)) {
            let cell = self.collectionView.cellForItem(at: indexPath) as! CollectionViewCell
            let text = cell.categoryLabel
            print(text?.text)
            
        } else {
            print("collection view was tapped")
        }
    }
}
