//
//  SlideContentManageable.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/18.
//

import Foundation
protocol SlideContentManageable {
    var elements: ElementCollection { get }
    func addElement(_ element: SlideElementProtocol)
    func removeElement(_ element: SlideElementProtocol)
}
