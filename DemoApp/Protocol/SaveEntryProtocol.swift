//
//  SaveEntryProtocol.swift
//  DemoApp
//
//  Created by Dhiraj Kumar Patil on 25/06/21.
//

import Foundation
protocol SaveEntryProtocol {
  func saveEntry(
    title: String,
    price: Double,
    date: Date,
    comment: String
  ) -> Bool
}
