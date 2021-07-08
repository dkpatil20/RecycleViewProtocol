//
//  ExpenseTypeTableCellVM.swift
//  DemoApp
//
//  Created by Dhiraj Kumar Patil on 26/06/21.
//

import Foundation
import RecycleViewProtocol
class ExpenseTypeTableCellVM: ItemViewModelProtocol {
    let model: ReportRange
    init(model: ReportRange) {
        self.model = model
    }
    var title: String {
        get{
            model.rawValue
        }
    }
    
}
