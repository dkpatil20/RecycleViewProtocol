//
//  NameSection.swift
//  DemoRecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import Foundation
import RecycleViewProtocol
class DemoSection: SectionViewModelProtocol {
    var items: [ItemViewModelProtocol] = []
    init() {
        items.append(NameViewModel(name: "Noopur"))
        items.append(NameViewModel(name: "Dhiraj"))
        items.append(NameViewModel(name: "Ram"))
        items.append(NameViewModel(name: "Manish"))
        items.append(NameViewModel(name: "Mohit"))
        items.append(NameViewModel(name: "Swati"))
        items.append(NameViewModel(name: "Dipu"))
        items.append(NameViewModel(name: "Vishal"))
        items.append(NameViewModel(name: "Narendra"))
        items.append(NameViewModel(name: "Atharv"))
        items.append(NameViewModel(name: "Daksh"))
    }
    
}
