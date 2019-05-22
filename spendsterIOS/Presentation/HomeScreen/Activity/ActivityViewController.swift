//
//  ActivityViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/17/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//  swiftlint:disable force_cast

import UIKit
import Parchment

class ActivityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ActivityView {
    @IBOutlet weak var expensesTableView: UITableView!
    private var presenter: ActivityPresenter?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.presenter?.expenses().count)!
        // TODO
        // real number of rows in server impl.
        // https://trello.com/c/uDMhmjnS/154-connect-expenses-to-the-server
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseItem", for: indexPath) as! ExpenseViewCell
        let expense = self.presenter?.expense(forIndex: indexPath.row)
        if let price = expense?.expenseAmount().description,
            let note = expense?.expenseNote() {
            cell.bind(category: "Moked Category", image: "oval", price: price, note: note)
        }
        return cell
        // TODO
        // real data binding in server impl.
        // https://trello.com/c/uDMhmjnS/154-connect-expenses-to-the-server
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell")
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func reloadData() {
        self.expensesTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.expensesTableView.delegate = self
        self.expensesTableView.dataSource = self
        self.presenter = ActivityPresenter(view: self, model: MockActivityModel(), repository: ActivityRepository())
        self.presenter?.presentCategories()
    }
}
