//
//  SlideContentManageable.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/18.
//

import Foundation
protocol SlideContentManageable {
    var elements: [SlideElement] { get }
    func addElement(_ element: SlideElement)
    func removeElement(_ element: SlideElement)
}
