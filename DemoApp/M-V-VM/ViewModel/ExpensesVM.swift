//
//  ExpensesVM.swift
//  DemoApp
//
//  Created by Dhiraj Kumar Patil on 01/07/21.
//

import Foundation
import RecycleViewProtocol
import CoreData

class ExpensesVM: ListViewModelProtocol {
    var sections: Observable<[SectionViewModelProtocol]> = Observable(value:[])
    var viewContext: NSManagedObjectContext
    let reportRange: ReportRange


    init(
        viewContext: NSManagedObjectContext = PersistenceController.shared.container.viewContext,
         reportRange: ReportRange
    ) {
      self.viewContext = viewContext
      self.reportRange = reportRange
    }
    
    private func getEntries() -> [ExpenseModelProtocol]  {
      let fetchRequest: NSFetchRequest<ExpenseModel> = ExpenseModel.fetchRequest()
      fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \ExpenseModel.date, ascending: false)]
      let (startDate, endDate) = reportRange.timeRange()
      fetchRequest.predicate = NSPredicate(
        format: "%@ <= date AND date <= %@",
        startDate as CVarArg,
        endDate as CVarArg)
      do {
        let results = try viewContext.fetch(fetchRequest)
        return results
      } catch let error {
        print(error)
        return []
      }
    }
    
    func createTableSections() {
        let section = DefaultSection()
        for expenseItem in getEntries() {
            let expenseItemVM = ExpenseViewModel(model: expenseItem)
            section.items.append(expenseItemVM)
        }
        self.sections.value = [section]
    }
}
