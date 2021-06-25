//
//  ListViewModelProtocol.swift
//  RecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import Foundation
public protocol ListViewModelProtocol {
    
    var sections: Observable<[SectionViewModelProtocol]> { get set }
    
    func numberOfSection() -> Int
    func numberOfRowIn(section: Int) -> Int
    func sectionAt(index: Int) -> SectionViewModelProtocol
    func itemAt(indexPath: IndexPath) -> ItemViewModelProtocol
    func insertItemAt(indexPath: IndexPath, model: ItemViewModelProtocol)
    func deleteIteamAt(indexPaths: [IndexPath]) -> [ItemViewModelProtocol]
    func deleteModelAt(indexPaths: [IndexPath])
    
}
public extension ListViewModelProtocol {
    func numberOfSection() -> Int{
        return sections.value.count
    }
    func numberOfRowIn(section: Int) -> Int {
        return sectionAt(index: section).numberOfRowIn()
    }
    func sectionAt(index: Int) -> SectionViewModelProtocol {
        return sections.value[index]
    }
    func itemAt(indexPath: IndexPath) -> ItemViewModelProtocol {
        return sectionAt(index: indexPath.section).itemForRow(index: indexPath.row)
    }
    func insertItemAt(indexPath: IndexPath, model: ItemViewModelProtocol)
    {
        var section = sectionAt(index: indexPath.section)
        section.insetIteamAt(row: indexPath.row, item: model)
    }
    func deleteModelAt(indexPaths: [IndexPath])
    {
        
    }
    func deleteIteamAt(indexPaths: [IndexPath]) -> [ItemViewModelProtocol] {
        self.deleteModelAt(indexPaths: indexPaths)
        var array = [ItemViewModelProtocol]()
        for indexPath in indexPaths {
            var section = sectionAt(index: indexPath.section)
            array.append(section.deleteIteamAt(row: indexPath.row))
        }
        return array
    }
}
