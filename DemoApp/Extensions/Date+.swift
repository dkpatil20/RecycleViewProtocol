//
//  Date+.swift
//  DemoApp
//
//  Created by Dhiraj Kumar Patil on 26/06/21.
//

import Foundation
extension Date {
  var startOfDay: Date {
    return Calendar.current.startOfDay(for: self)
  }

  var startOfMonth: Date {
    let calendar = Calendar(identifier: .gregorian)
    let components = calendar.dateComponents([.year, .month], from: self)
    return calendar.date(from: components) ?? Date()
  }

  var startOfWeek: Date {
    let calendar = Calendar(identifier: .gregorian)
    let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
    return calendar.date(from: components) ?? Date()
  }

  var endOfDay: Date {
    var components = DateComponents()
    components.day = 1
    components.second = -1
    return Calendar.current.date(byAdding: components, to: startOfDay) ?? Date()
  }

  var endOfMonth: Date {
    var components = DateComponents()
    components.month = 1
    components.second = -1
    return Calendar(identifier: .gregorian).date(byAdding: components, to: startOfMonth) ?? Date()
  }

  var endOfWeek: Date {
    var components = DateComponents()
    components.weekOfYear = 1
    components.second = -1
    return Calendar(identifier: .gregorian).date(byAdding: components, to: startOfWeek) ?? Date()
  }
    static let dateFormatter: DateFormatter = {
      var dateFormatter = DateFormatter()
      dateFormatter.dateStyle = .medium
      dateFormatter.timeStyle = .none
      return dateFormatter
    }()

    static let timeFormatter: DateFormatter = {
      var dateFormatter = DateFormatter()
      dateFormatter.dateStyle = .none
      dateFormatter.timeStyle = .medium
      return dateFormatter
    }()
}
