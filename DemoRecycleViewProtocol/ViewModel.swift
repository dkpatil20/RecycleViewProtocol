//
//  ViewModel.swift
//  DemoRecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import Foundation
import RecycleViewProtocol
class ViewModel:  ListViewModelProtocol{
    var sections: [SectionViewModelProtocol] = []
    init() {
        sections.append(DemoSection1())
        sections.append(DemoSection1())
    }
    
}
