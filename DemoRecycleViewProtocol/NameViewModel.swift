//
//  DemoViewModel1.swift
//  DemoRecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import Foundation
import RecycleViewProtocol
class DemoViewModel1: ItemViewModelProtocol {
    let name: String
    init(name: String) {
        self.name = name
    }
}
