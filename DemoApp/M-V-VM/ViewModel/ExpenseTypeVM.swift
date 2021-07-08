//
//  ExpenseTypeVM.swift
//  DemoApp
//
//  Created by Dhiraj Kumar Patil on 26/06/21.
//

import Foundation
import RecycleViewProtocol
class ExpenseTypeVM: ListViewModelProtocol {
    var sections: Observable<[SectionViewModelProtocol]> = Observable(value: [])
    
    func createSections() {
        let defaulSection = DefaultSection()
        for expenseType in ReportRange.allCases {
            defaulSection.items.append(ExpenseTypeTableCellVM(model: expenseType))
        }
        self.sections.value = [defaulSection]
    }
}
