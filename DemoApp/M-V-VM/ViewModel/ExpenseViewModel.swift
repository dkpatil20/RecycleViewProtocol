//
//  ExpenseViewModel.swift
//  DemoApp
//
//  Created by Dhiraj Kumar Patil on 01/07/21.
//

import Foundation
import RecycleViewProtocol
class ExpenseViewModel: ItemViewModelProtocol {
    var model: ExpenseModelProtocol
    init(model: ExpenseModelProtocol) {
        self.model = model
    }
    var title: String {
        model.title ?? ""
    }
    var price: String {
        String(format: "%.2f", model.price)
    }
    var comment: String {
        model.comment ?? ""
    }
    var date: String {
        if let date = model.date {
            return Date.dateFormatter.string(from: date)
        }
        return ""
    }
    var time: String {
        if let date = model.date {
            return Date.timeFormatter.string(from: date)
        }
        return ""
    }
}
