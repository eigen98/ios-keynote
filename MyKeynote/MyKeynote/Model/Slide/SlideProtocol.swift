//
//  SlideProtocol.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/24.
//

import Foundation
protocol SlideProtocol : SlideContentManageable, Order, CustomStringConvertible {
    var id : String { get }
    var backgroundColor: SlideRGBColor { get set }
    var orderIndex: Int { get set }
    var elements: ElementCollection { get }
}

