//
//  TableViewProtocol.swift
//  RecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import UIKit

public protocol TableViewProtocol {
    func internal_numberOfSections(in tableView: UITableView) -> Int
    func internal_tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func internal_tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

public extension TableViewProtocol where Self: GetTableViewModelProtocol & MapCellViewModel {

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
}
