//
//  DemoSection1.swift
//  DemoRecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import Foundation
import RecycleViewProtocol
class DemoSection1: SectionViewModelProtocol {
    var items: [ItemViewModelProtocol] = [] {
        didSet {
            print(items)
        }
    }
    init() {
        
        if let cellVM = DemoViewModel1(model: DemoModel1(name: "Tom"))
        {
            items.append(cellVM)
        }
        if let cellVM = DemoViewModel1(model: DemoModel1(name: "Jerry"))
        {
            items.append(cellVM)
        }
        if let cellVM = DemoViewModel1(model: DemoModel1(name: "Tom & Jerry"))
        {
            items.append(cellVM)
        }
        if let cellVM = DemoViewModel1(model: DemoModel1(name: "Micheal"))
        {
            items.append(cellVM)
        }
        if let cellVM = DemoViewModel2(model: DemoModel2(name: "Dhriaj", emailId: "dhiru@gmail.com"))
        {
            items.append(cellVM)
        }
    }
    
}
