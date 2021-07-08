//
//  ExpenseItemTableCell.swift
//  DemoApp
//
//  Created by Dhiraj Kumar Patil on 01/07/21.
//

import UIKit
import RecycleViewProtocol
class ExpenseItemTableCell: UITableViewCell, ReuseIdentifierProtocol {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ExpenseItemTableCell: ItemViewProtocol {
    func updateView(itemViewModel: ItemViewModelProtocol) {
        if let cellVM = itemViewModel as? ExpenseViewModel {
            self.titleLbl.text = cellVM.title
            self.priceLbl.text = cellVM.price
            self.commentLbl.text = cellVM.comment
            self.dateLbl.text = cellVM.date
            self.timeLbl.text = cellVM.time
        }
    }
}
