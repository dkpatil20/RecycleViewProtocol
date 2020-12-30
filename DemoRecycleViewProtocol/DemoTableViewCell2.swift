//
//  DemoTableViewCell2.swift
//  DemoRecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import UIKit
import RecycleViewProtocol
class DemoTableViewCell2: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailIDLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension DemoTableViewCell2: ItemViewProtocol {
    func updateView(itemViewModel: ItemViewModelProtocol) {
        if let demoVM = itemViewModel as? DemoViewModel2 {
            self.nameLabel.text = demoVM.name
            self.emailIDLabel.text = demoVM.emailId
        }
    }
}
