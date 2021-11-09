//
//  DefaultSection.swift
//  RecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 26/06/21.
//

import Foundation
public class DefaultSection: SectionViewModelProtocol {
    public func deleteIteamAt(row:Int) ->ItemViewModelProtocol {
        return items.remove(at: row)
    }
    public func insetIteamAt(row:Int, item: ItemViewModelProtocol) {
        items.insert(item, at: row)
    }
    public var items: [ItemViewModelProtocol]
    public init() {
        self.items = []
    }
}
