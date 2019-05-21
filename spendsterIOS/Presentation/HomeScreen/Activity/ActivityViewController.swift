//
//  ActivityViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 4/17/19.
//  Copyright © 2019 KeyToTech. All rights reserved.

import UIKit
import Parchment

class ActivityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var expensesTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        //TODO
        // real number of rows in server impl.
        // https://trello.com/c/uDMhmjnS/154-connect-expenses-to-the-server
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.expensesTableView.dequeueReusableCell(withIdentifier: "ExpenseItem", for: indexPath)
        return cell
        //TODO
        //real data binding in server impl.
        // https://trello.com/c/uDMhmjnS/154-connect-expenses-to-the-server
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.expensesTableView.delegate = self
        self.expensesTableView.dataSource = self
    }
}
