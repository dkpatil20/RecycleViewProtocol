//
//  ExpenseModelProtocol.swift
//  DemoApp
//
//  Created by Dhiraj Kumar Patil on 25/06/21.
//

import Foundation
protocol ExpenseModelProtocol {
  var title: String? { get }
  var price: Double { get }
  var comment: String? { get }
  var date: Date? { get }
  var id: UUID? { get }
}
