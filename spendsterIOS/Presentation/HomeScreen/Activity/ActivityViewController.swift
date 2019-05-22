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
    
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if cell.responds(to: #selector(getter: UIView.tintColor)){
            if tableView == self.expensesTableView {
                let cornerRadius: CGFloat = 12.0
                cell.backgroundColor = .clear
                let layer: CAShapeLayer = CAShapeLayer()
                let path: CGMutablePath = CGMutablePath()
                let bounds: CGRect = cell.bounds
                bounds.insetBy(dx: 25.0, dy: 0.0)
                
                if indexPath.row == 0 && indexPath.row == ( tableView.numberOfRows(inSection: indexPath.section) - 1) {
                    path.addRoundedRect(in: bounds, cornerWidth: cornerRadius, cornerHeight: cornerRadius)
                    
                } else if indexPath.row == 0 {
                    path.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
                    path.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.minY), tangent2End: CGPoint(x: bounds.midX, y: bounds.minY), radius: cornerRadius)
                    path.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.minY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
                    path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
                    
                } else if indexPath.row == (tableView.numberOfRows(inSection: indexPath.section) - 1) {
                    path.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
                    path.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.midX, y: bounds.maxY), radius: cornerRadius)
                    path.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
                    path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
                    
                } else {
                    path.addRect(bounds)

                }
                
                layer.path = path
                layer.fillColor = UIColor.white.cgColor
                let testView: UIView = UIView(frame: bounds)
                
                testView.layer.insertSublayer(layer, at: 0)
                testView.backgroundColor = .clear
                cell.backgroundView = testView
            }
        }
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
