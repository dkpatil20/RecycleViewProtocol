//
//  EditTableViewDataSource.swift
//  RecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 25/06/21.
//

import UIKit

public class EditTableViewDataSource: TableViewDataSource, EditTableViewProtocol {
    public override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        self.internal_tableView(tableView, moveRowAt: sourceIndexPath, to: destinationIndexPath)
    }

}
