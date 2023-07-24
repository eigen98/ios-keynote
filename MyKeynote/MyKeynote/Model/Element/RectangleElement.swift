//
//  RectangleElement.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/23.
//

import Foundation
class RectangleElement : BaseElement{
    var width: CGFloat
    var height: CGFloat
    
    init(id: String, position: CGPoint, size: CGSize, width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        super.init(id: id, position: position, size: size)
    }
    
    required init(id: String, position: CGPoint, size: CGSize) {
        self.width = size.width
        self.height = size.height
        super.init(id: id, position: position, size: size)
        
    }
}
