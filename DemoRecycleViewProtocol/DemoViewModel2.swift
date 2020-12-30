//
//  DemoViewModel2.swift
//  DemoRecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import Foundation
import RecycleViewProtocol
class DemoViewModel2: ItemViewModelProtocol {
    var model: ModelProtocol
    let name: String
    let emailId: String
    
    required init?(model: ModelProtocol) {
        self.model = model
        if let model = model as? DemoModel2 {
            self.name = model.name
            self.emailId = model.emailId
        } else{
            return nil
        }
    }
    
}
class DemoModel2: ModelProtocol {
    let name: String
    let emailId: String
    init(name: String, emailId: String) {
        self.name = name
        self.emailId = emailId
    }
}
