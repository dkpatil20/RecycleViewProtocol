//
//  ExpensesVC.swift
//  DemoApp
//
//  Created by Dhiraj Kumar Patil on 01/07/21.
//

import UIKit
import RecycleViewProtocol
protocol ExpensesVMProtocol {
    func createTableSections()
    var reportRange: ReportRange { get }
}
class ExpensesVC: UIViewController, ReuseIdentifierProtocol {
    @IBOutlet weak var tableView: UITableView!

    let viewModel: ExpensesVMProtocol & ListViewModelProtocol
    var tableDataSource: DefaultTableViewDataSource?

    init?(coder: NSCoder, viewModel: ExpensesVMProtocol & ListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a user.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.reportRange.rawValue
        tableDataSource = DefaultTableViewDataSource(tableView: tableView, tableViewModelDelegate: self, mapCellViewModelDelegate: self, registerCellDelegate: self)

        viewModel.createTableSections()

        // Do any additional setup after loading the view.
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ExpensesVC: RegisterCellProtocol {
    func registerCell() {
        tableView.register(
            UINib(
                nibName: ExpenseItemTableCell.reuseIdentifier(),
                bundle: nil
            ),
            forCellReuseIdentifier: ExpenseItemTableCell.reuseIdentifier()
        )
    }
}
extension ExpensesVC: GetTableViewModelProtocol {
    func tableViewModel() -> ListViewModelProtocol {
        self.viewModel
    }
}
extension ExpensesVC: MapCellViewModel {
    func identifierFor(itemViewModel: ItemViewModelProtocol) -> String {
        switch itemViewModel {
        case is ExpenseViewModel:
            return ExpenseItemTableCell.reuseIdentifier()
        default:
            return ""
        }
    }
}
