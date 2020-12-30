//
//  TableViewProtocol.swift
//  RecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import UIKit
public protocol TableViewProtocol {
    func tableViewModel() -> ListViewModelProtocol
    func identifierFor(itemViewModel: ItemViewModelProtocol) -> String
    func internal_numberOfSections(in tableView: UITableView) -> Int
    func internal_tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func internal_tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func internal_tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    func internal_deleteRow(tableView: UITableView, at indexPaths: [IndexPath],with animation: UITableView.RowAnimation)
    func internal_insertRow(tableView: UITableView, at indexPaths: [IndexPath],with animation: UITableView.RowAnimation)
}

public extension TableViewProtocol {

    func internal_numberOfSections(in tableView: UITableView) -> Int {
        return self.tableViewModel().numberOfSection()
    }

    func internal_tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewModel().numberOfRowIn(section: section)
    }

    func internal_tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemViewModel = self.tableViewModel().itemAt(indexPath: indexPath)
        let identifier = self.identifierFor(itemViewModel: itemViewModel)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let itemView = cell as? ItemViewProtocol {
            itemView.updateView(itemViewModel: itemViewModel)
        }
        return cell
    }
    func internal_insertRow(tableView: UITableView, at indexPaths: [IndexPath],with animation: UITableView.RowAnimation) {
        tableView.performBatchUpdates({
            tableView.insertRows(at: indexPaths, with: animation)
        }, completion: nil)
    }
    func internal_deleteRow(tableView: UITableView, at indexPaths: [IndexPath],with animation: UITableView.RowAnimation) {
        self.tableViewModel().deleteIteamAt(indexPaths: indexPaths)
        tableView.performBatchUpdates({
            tableView.deleteRows(at: indexPaths, with: animation)
        }, completion: nil)
    }
    func internal_tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if let moveRowItem = self.tableViewModel().deleteIteamAt(indexPaths: [sourceIndexPath]).first {
            self.tableViewModel().insertItemAt(indexPath: destinationIndexPath, model: moveRowItem)
        }
    }
}
