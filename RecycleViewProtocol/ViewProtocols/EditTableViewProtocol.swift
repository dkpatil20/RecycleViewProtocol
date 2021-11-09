//
//  EditTableViewProtocol.swift
//  RecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 25/06/21.
//

import UIKit

public protocol EditTableViewProtocol {
    func internal_tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    func internal_deleteRow(tableView: UITableView, at indexPaths: [IndexPath],with animation: UITableView.RowAnimation)
    func internal_insertRow(tableView: UITableView, at indexPaths: [IndexPath],with animation: UITableView.RowAnimation)
}

public extension EditTableViewProtocol where Self: GetTableViewModelProtocol & MapCellViewModel {
    func internal_insertRow(tableView: UITableView, at indexPaths: [IndexPath],with animation: UITableView.RowAnimation) {
        tableView.performBatchUpdates({
            tableView.insertRows(at: indexPaths, with: animation)
        }, completion: nil)
    }
    func internal_deleteRow(tableView: UITableView, at indexPaths: [IndexPath],with animation: UITableView.RowAnimation) {
        _ = self.tableViewModel().deleteIteamAt(indexPaths: indexPaths)
        tableView.performBatchUpdates({
            tableView.deleteRows(at: indexPaths, with: animation)
        }, completion: nil)
    }
    func internal_tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if let moveRowItem = self.tableViewModel().deleteIteamAt(indexPaths: [sourceIndexPath]).first {
            var tableViewModel = self.tableViewModel()
            tableViewModel.insertItemAt(indexPath: destinationIndexPath, model: moveRowItem)
        }
    }
}
