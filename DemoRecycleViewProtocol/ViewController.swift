//
//  ViewController.swift
//  DemoRecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import UIKit
import RecycleViewProtocol
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func editButtonClicked(_ sender: UIBarButtonItem) {
        tableView.setEditing(true, animated: true)
    }
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        
    }
}

extension ViewController:UITableViewDataSource, TableViewProtocol {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.internal_numberOfSections(in: tableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.internal_tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.internal_tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableViewModel() -> ListViewModelProtocol {
        return self.viewModel
    }
    
    func identifierFor(itemViewModel: ItemViewModelProtocol) -> String {
        switch itemViewModel {
        case is DemoViewModel2:
            return "DemoTableViewCell2"
        case is DemoViewModel1:
            return "DemoTableViewCell1"
        default:
            return ""
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .none:
            break
        case .delete:
            self.internal_deleteRow(tableView: tableView, at: [indexPath], with: .automatic)
            break
        case .insert:
            break
        @unknown default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        self.internal_tableView(tableView, moveRowAt: sourceIndexPath, to: destinationIndexPath)
    }
    
}

