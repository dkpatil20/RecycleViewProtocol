//
//  ReportRange.swift
//  DemoApp
//
//  Created by Dhiraj Kumar Patil on 26/06/21.
//

import Foundation
enum ReportRange: String, CaseIterable {
  case daily = "Today"
  case weekly = "This Week"
  case monthly = "This Month"
  func timeRange() -> (Date, Date) {
    let now = Date()
    switch self {
    case .daily:
      return (now.startOfDay, now.endOfDay)
    case .weekly:
      return (now.startOfWeek, now.endOfWeek)
    case .monthly:
      return (now.startOfMonth, now.endOfMonth)
    }
  }
}
