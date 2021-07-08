//
//  ReuseIdentifierProtocol.swift
//  RecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 26/06/21.
//

import Foundation
public protocol ReuseIdentifierProtocol {
    static  func reuseIdentifier() -> String
}
public extension ReuseIdentifierProtocol {
    static func reuseIdentifier() -> String {
        return "\(Self.self)"
    }
}
