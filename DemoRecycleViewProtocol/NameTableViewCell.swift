//
//  DemoTableViewCell1.swift
//  DemoRecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import UIKit
import RecycleViewProtocol
class DemoTableViewCell1: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension DemoTableViewCell1: ItemViewProtocol {
    func updateView(itemViewModel: ItemViewModelProtocol) {
        if let nameVM = itemViewModel as? DemoViewModel1 {
            self.nameLabel.text = nameVM.name
        }
    }
    
    
}
