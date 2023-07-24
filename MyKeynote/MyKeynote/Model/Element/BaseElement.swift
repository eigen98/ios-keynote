//
//  RectangleElement.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/20.
//

import Foundation
class BaseElement: SlideElement, Selectable {
    
    
    private let id: String
    var position: CGPoint
    var size: CGSize
    var backgroundColor: SlideRGBColor
    var animation: AnimationApplicable?
    var alpha: AlphaLevel
    var isSelected: Bool = false

    
    required init(id : String, position: CGPoint, size: CGSize) {
        self.id = id
        self.position = position
        self.size = size
        backgroundColor =  .init(red: 222, green: 222, blue: 0)
        alpha = .level10
    }
    
    init(id : String, position: CGPoint, size: CGSize, animation: AnimationApplicable? = nil) {
        self.id = id
        self.position = position
        self.size = size
        self.animation = animation
        backgroundColor =  .init(red: 222, green: 222, blue: 222)
        alpha = .level1
    }

    func display() {
        
        if isSelected {
            
        }
    }

    func select() {
        isSelected = true
    }

    func deselect() {
        isSelected = false
    }
}
