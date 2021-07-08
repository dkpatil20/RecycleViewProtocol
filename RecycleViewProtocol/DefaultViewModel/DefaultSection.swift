//
//  DefaultSection.swift
//  RecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 26/06/21.
//

import Foundation
public class DefaultSection: SectionViewModelProtocol {
    public var items: [ItemViewModelProtocol]
    public init() {
        self.items = []
    }
}
