//
//  ExpenseTypeTableCell.swift
//  DemoApp
//
//  Created by Dhiraj Kumar Patil on 26/06/21.
//

import UIKit
import RecycleViewProtocol

class ExpenseTypeTableCell: UITableViewCell, ReuseIdentifierProtocol {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ExpenseTypeTableCell: ItemViewProtocol {
    func updateView(itemViewModel: ItemViewModelProtocol) {
        if let cellVM = itemViewModel as? ExpenseTypeTableCellVM {
            titleLabel.text = cellVM.title
        }
    }
}
