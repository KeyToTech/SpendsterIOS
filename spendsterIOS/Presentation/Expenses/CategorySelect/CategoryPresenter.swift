//
//  CategoryPresenter.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/10/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import Foundation
import RxSwift

class CategoryPresenter {
    private let bag = DisposeBag()
    private let model: CategoryModelProtocol
    private let view: CategoryView
    private let repository: CategoryRepository
    
    init(model: CategoryModelProtocol, view: CategoryView, repository: CategoryRepository) {
        self.model = model
        self.view = view
        self.repository = repository
    }
    
    func presentCategories() {
        self.view.disableUIInteraction()
        self.model.fetchCategories()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: {categories in
                self.repository.applyCategories(categories: categories)
                self.view.reloadData()
                self.view.enableUIInteraction()
//            },
//                       onError: {error in
//                self.showError(error: error)
            })
            .disposed(by: bag)
    }
    
     func categories() -> [Category] {
         return self.repository.categories
     }
    
     func category(forIndex index: Int) -> Category {
         return self.repository.categories[index]
     }
}
