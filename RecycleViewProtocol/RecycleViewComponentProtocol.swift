//
//  RecycleViewComponentProtocol.swift
//  RecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 18/12/20.
//

import Foundation
protocol ListViewProtocol {
    var sections: [SectionProtocol] { get set }
    
    func numberOfSection() -> Int
    func numberOfRowIn(section section: Int) -> Int
    func sectionAt(index: Int) -> SectionProtocol
    func itemAt(indexPath indexPath: IndexPath) -> ItemProtocol
}
