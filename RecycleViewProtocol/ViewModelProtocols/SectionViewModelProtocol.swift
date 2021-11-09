//
//  SectionViewModelProtocol.swift
//  RecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import Foundation
public protocol SectionViewModelProtocol {
    var items:[ItemViewModelProtocol] { get set }
   
    func numberOfRowIn() -> Int
    func itemForRow(index: Int) -> ItemViewModelProtocol
    func insetIteamAt(row:Int, item: ItemViewModelProtocol)
    func deleteIteamAt(row:Int) ->ItemViewModelProtocol
}

public extension SectionViewModelProtocol {
    func numberOfRowIn() -> Int {
        return items.count
    }
    func itemForRow(index: Int) -> ItemViewModelProtocol {
        return items[index]
    }
}
