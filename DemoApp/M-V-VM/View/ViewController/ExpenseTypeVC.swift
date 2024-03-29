//
//  ExpenseTypeVC.swift
//  DemoApp
//
//  Created by Dhiraj Kumar Patil on 25/06/21.
//

import UIKit
import RecycleViewProtocol
protocol ExpenseTypeVMProtocol {
    func createSections()
    func addSection()
}

class ExpenseTypeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel: ExpenseTypeVMProtocol & ListViewModelProtocol = ExpenseTypeVM()
    var tableDataSource: TableViewProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableDataSource = DefaultTableViewDataSource(
            tableView: tableView,
            tableViewModelDelegate: self,
            mapCellViewModelDelegate: self,
            registerCellDelegate: self)
        tableView.delegate = self
        viewModel.createSections()

        // Do any additional setup after loading the view.
    }
    @IBAction func addSectionActionn(_ sender: Any) {
        self.viewModel.addSection()
    }
    
}
extension ExpenseTypeVC: RegisterCellProtocol {
    func registerCell() {
        tableView.register(
            UINib(
                nibName: ExpenseTypeTableCell.reuseIdentifier(),
                bundle: nil
            ),
            forCellReuseIdentifier: ExpenseTypeTableCell.reuseIdentifier()
        )
    }
}
extension ExpenseTypeVC: GetTableViewModelProtocol {
    func tableViewModel() -> ListViewModelProtocol {
        self.viewModel
    }
}
extension ExpenseTypeVC: MapCellViewModel {
    func identifierFor(itemViewModel: ItemViewModelProtocol) -> String {
        switch itemViewModel {
        case is ExpenseTypeTableCellVM:
            return ExpenseTypeTableCell.reuseIdentifier()
        default:
            return ""
        }
    }
}

extension ExpenseTypeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let rangeVM = self.viewModel.itemAt(indexPath: indexPath) as? ExpenseTypeTableCellVM , let vc = self.storyboard?.instantiateViewController(identifier: ExpensesVC.reuseIdentifier(), creator: { (coder) -> UIViewController? in
            let persistenceController = rangeVM.model == .daily ? PersistenceController.preview : PersistenceController.preview
            let vm = ExpensesVM(viewContext: persistenceController.container.viewContext, reportRange: rangeVM.model)
            return ExpensesVC(coder: coder, viewModel: vm)
        }) {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
