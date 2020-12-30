//
//  DemoViewModel1.swift
//  DemoRecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import Foundation
import RecycleViewProtocol
class DemoViewModel1: ItemViewModelProtocol {
    var model: DemoModel1
    var name: String
    
    required init?(model: DemoModel1) {
        self.model = model
        if let model = model as? DemoModel1 {
            self.name = model.name
        } else{
            return nil
        }
    }
    
}
class DemoModel1: ModelProtocol {
    let name: String
    init(name: String) {
        self.name = name
    }
}
