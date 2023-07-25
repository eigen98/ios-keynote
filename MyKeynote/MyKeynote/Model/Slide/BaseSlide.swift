//
//  SquareSlide.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/18.
//

import Foundation

class BaseSlide : SlideProtocol {
   
    private let id: String
    var backgroundColor: SlideRGBColor
    
    //Order
    var orderIndex: Int = 0
    
    //SlideContentManageable
    private(set) var elements: ElementCollection = ElementCollection()
    
    init(id: String, backgroundColor: SlideRGBColor) {
        self.id = id
        self.backgroundColor = backgroundColor
    }
}
//SlideContentManageable
extension BaseSlide{
    func addElement(_ element: SlideElementProtocol) {
        self.elements.addElement(element: element)
    }
    
    func removeElement(_ element: SlideElementProtocol) {
        
    }
}

//Order
extension BaseSlide{
    func moveForward() {
        
    }
    
    func moveBackward() {
        
    }
}

extension BaseSlide : CustomStringConvertible{
    var description: String {
        return "(\(id)), R:\(backgroundColor.red), G:\(backgroundColor.green), B:\(backgroundColor.blue)"
    }
}


