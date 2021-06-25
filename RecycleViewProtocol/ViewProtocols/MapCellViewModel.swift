//
//  MapCellViewModel.swift
//  RecycleViewProtocol
//
//  Created by Dhiraj Kumar Patil on 25/06/21.
//

import Foundation

public protocol MapCellViewModel {
    func identifierFor(itemViewModel: ItemViewModelProtocol) -> String
}
