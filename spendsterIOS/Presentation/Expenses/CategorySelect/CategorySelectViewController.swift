//
//  CategorySelectViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/8/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//  swiftlint:disable force_cast

import UIKit

protocol CategorySelectViewControllelDelegate: class {
    func categoryChoosed(categoryId: String?, categoryLabel: String?)
}

class CategorySelectViewController: UIViewController, CategoryView, UICollectionViewDataSource, UICollectionViewDelegate {

    var selectedCategoryId: String?
    private var presenter: CategoryPresenter?
    weak var delegate: CategorySelectViewControllelDelegate?
    @IBOutlet weak var veil: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var whileIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func initDefaultUI() {
        self.veil.isHidden = true
        self.whileIndicator.isHidden = true
        self.errorLabel.isHidden = true
        self.whileIndicator.stopAnimating()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = CategoryPresenter.init(model: SimpleCategoryModel(), view: self, repository: CategoryRepository())

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.presenter?.presentCategories()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.presenter?.categories().count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellView", for: indexPath) as! CollectionViewCell
        if let label = presenter?.category(forIndex: indexPath.row).categoryName {
            cell.bind(label: label, image: "Calendar-for-light-theme")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
            let text = cell.categoryLabel.text
            let categoryId = self.presenter?.category(forIndex: indexPath.row).categoryId
            self.delegate?.categoryChoosed(categoryId: categoryId, categoryLabel: text)
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    func reloadData() {
        self.collectionView.reloadData()
    }
    
    func showError(withMessage: String) {
        self.errorLabel.text = withMessage
        self.errorLabel.isHidden = false
    }
    
    func showLoading() {
        self.interactions(enabled: false)
        self.whileIndicator.startAnimating()
    }
    
    func hideLoading() {
        self.interactions(enabled: true)
        self.whileIndicator.stopAnimating()
    }
    
    private func interactions(enabled: Bool) {
        self.veil.isHidden = enabled
        self.collectionView.isUserInteractionEnabled = enabled
        self.whileIndicator.isHidden = enabled
    }
}
