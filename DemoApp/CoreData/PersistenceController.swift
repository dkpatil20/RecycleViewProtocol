//
//  PersistenceController.swift
//  DemoApp
//
//  Created by Dhiraj Kumar Patil on 25/06/21.
//

import Foundation
import CoreData

struct PersistenceController {
  static let shared = PersistenceController()
  let container: NSPersistentContainer

  init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "DemoApp")
    if inMemory {
      container.persistentStoreDescriptions.first?.url = URL(
        fileURLWithPath: "/dev/null")
    }
    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
  }
    // MARK: - Core Data Saving support

    func saveContext () {
        let context = self.container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
  static var preview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext
    for index in 1..<60 {
      let newItem = ExpenseModel(context: viewContext)
      newItem.title = "Test Title \(index)"
      newItem.date = Date(timeIntervalSinceNow: Double(index * -21600))
      newItem.comment = "Test Comment \(index)"
      newItem.price = Double(index + 1) * 12.3
      newItem.id = UUID()
    }
    do {
      try viewContext.save()
    } catch {
      let nsError = error as NSError
      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
    return result
  }()

  static let previewItem: ExpenseModel = {
    let newItem = ExpenseModel(context: preview.container.viewContext)
    newItem.title = "Preview Item Title"
    newItem.date = Date(timeIntervalSinceNow: 60)
    newItem.comment = "Preview Item Comment"
    newItem.price = 12.34
    newItem.id = UUID()
    return newItem
  }()
}
