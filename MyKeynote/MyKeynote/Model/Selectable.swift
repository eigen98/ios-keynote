//
//  Selectable.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/19.
//

import Foundation

protocol Selectable{
    var isSelected: Bool { get set }
    func select()
    func deselect()
}
