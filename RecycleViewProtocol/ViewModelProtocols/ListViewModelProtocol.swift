//
//  ListViewModelProtocol.swift
//  RecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import Foundation
public protocol ListViewModelProtocol {
    
    typealias Items = [SectionViewModelProtocol]
    typealias ItemsIndex = Items.Index
    typealias ItemsElement = Items.Element

    var sections: Observable<Items> { get set }
    
    func numberOfSection() -> Int
    func numberOfRowIn(section: Int) -> Int
    func sectionAt(index: Int) -> SectionViewModelProtocol
    func itemAt(indexPath: IndexPath) -> ItemViewModelProtocol
    func insert(section: SectionViewModelProtocol)
    mutating func insertItemAt(indexPath: IndexPath, model: ItemViewModelProtocol)
    func deleteIteamAt(indexPaths: [IndexPath]) -> [ItemViewModelProtocol]
    func deleteModelAt(indexPaths: [IndexPath])
    
}
public extension ListViewModelProtocol {
    func numberOfSection() -> Int{
        return self.count
    }
    func numberOfRowIn(section: Int) -> Int {
        return self[section].numberOfRowIn()
    }
    func sectionAt(index: Int) -> SectionViewModelProtocol {
        return self[index]
    }
    
    func itemAt(indexPath: IndexPath) -> ItemViewModelProtocol {
        return self[indexPath.section].itemForRow(index: indexPath.row)
    }
    func insert(section: SectionViewModelProtocol) {
        sections.value.append(section)
    }
    
    func insertItemAt(indexPath: IndexPath, model: ItemViewModelProtocol)
    {
        self[indexPath.section].insetIteamAt(row: indexPath.row, item: model)
    }
    func deleteModelAt(indexPaths: [IndexPath])
    {
        
    }
    func deleteIteamAt(indexPaths: [IndexPath]) -> [ItemViewModelProtocol] {
        self.deleteModelAt(indexPaths: indexPaths)
        var array = [ItemViewModelProtocol]()
        for indexPath in indexPaths {
            var section = self[indexPath.section]
            array.append(section.deleteIteamAt(row: indexPath.row))
        }
        return array
    }
}
public extension ListViewModelProtocol {
    var startIndex: ItemsIndex {
        return sections.value.startIndex
    }
    var endIndex: ItemsIndex {
        return sections.value.endIndex
    }
    var count: Int {
        sections.value.count
    }
    subscript(position: ItemsIndex) -> ItemsElement {
        get {
            return sections.value[position]
        }
        set{
            sections.value[position] = newValue
        }
    }
    func index(after i: ItemsIndex) -> ItemsIndex {
        return sections.value.index(after: i)
    }
}

