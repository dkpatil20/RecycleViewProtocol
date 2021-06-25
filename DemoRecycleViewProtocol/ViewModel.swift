//
//  ViewModel.swift
//  DemoRecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import Foundation
import RecycleViewProtocol
class ViewModel:  ListViewModelProtocol{
    var sections: Observable<[SectionViewModelProtocol]> = Observable(value: [])
    
    func creatSections() {
        var sectionsArray = [SectionViewModelProtocol]()
        sectionsArray.append(DemoSection1())
        sectionsArray.append(DemoSection1())
        sections = Observable(value: sectionsArray)
    }
}
