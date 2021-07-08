//
//  ExpenseModel+CoreDataProperties.swift
//  DemoApp
//
//  Created by Dhiraj Kumar Patil on 26/06/21.
//
//

import Foundation
import CoreData


extension ExpenseModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExpenseModel> {
        return NSFetchRequest<ExpenseModel>(entityName: "ExpenseModel")
    }

    @NSManaged public var comment: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var price: Double
    @NSManaged public var title: String?

}

extension ExpenseModel : Identifiable {

}
