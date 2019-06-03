//
//  ExpenseView.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/31/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit
protocol ExpenseButtonDelegate: class {
    func didDeleteButtonPressed()
    func didCalcelButtonPressed()
    func didAddButtonPressed()
}

@IBDesignable
class ExpenseView: UIView {
    
    let nibName = "ExpenseView"
    var contentView:UIView?
    
    weak var delegate: ExpenseButtonDelegate?
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addButton: CornerButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var calendar: BorderView!
    @IBOutlet weak var category: BorderView!
    @IBOutlet weak var currency: BorderView!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var veil: UIView!
    @IBOutlet weak var whileIndicator: UIActivityIndicatorView!
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.delegate?.didCalcelButtonPressed()
    }
    @IBAction func deleteButtonPressed(_ sender: Any) {
        self.delegate?.didDeleteButtonPressed()
    }
    @IBAction func addButtonPressed(_ sender: Any) {
        self.delegate?.didAddButtonPressed()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
