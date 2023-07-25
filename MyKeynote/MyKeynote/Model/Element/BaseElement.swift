//
//  RectangleElement.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/20.
//

import Foundation
class BaseElement: SlideElementProtocol {
   
    //SlideElementProtocol
    let id: String
    var size: CGSize
    var backgroundColor: SlideRGBColor
    var animation: AnimationApplicable?
    var alpha: AlphaLevel
    
    //Selectable
    var isSelected: Bool = false
    
    //Draggable
    var position: CGPoint

    //Order
    var orderIndex: Int = 0
    
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
    
    //Draggable
    func startDrag(at point: CGPoint) {
        
    }
    
    func drag(to point: CGPoint) {
        
    }
    
    func endDrag(at point: CGPoint) {
        
    }
    //Selectable
    func select() {
        isSelected = true
    }

    func deselect() {
        isSelected = false
    }
    
    //Resizable
    func resize(to newSize: CGSize) {
        
    }
    
    
    //Order
    func moveForward() {
        
    }
    
    func moveBackward() {
    
    }
    
   

    
}
