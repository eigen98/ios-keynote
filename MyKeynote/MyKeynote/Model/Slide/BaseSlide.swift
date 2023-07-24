//
//  SquareSlide.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/18.
//

import Foundation

class BaseSlide : SlideContentManageable, SlideDisplayable{
    
    private let id: String
    var length: Int
    var backgroundColor: SlideRGBColor
    var alpha: AlphaLevel = .level1
    private(set) var elements: [SlideElementProtocol] = []
    
    init(id: String, length: Int, backgroundColor: SlideRGBColor) {
        self.id = id
        self.length = length
        self.backgroundColor = backgroundColor
    }
    
    func prepareForDisplay() {
        
    }
    
    func addElement(_ element: SlideElementProtocol) {
        self.elements.append(element)
    }
    
    func removeElement(_ element: SlideElementProtocol) {
        
    }
    
    func display() {
        
    }
    
    
}

extension BaseSlide : CustomStringConvertible{
    var description: String {
        return "(\(id)), Side:\(length), R:\(backgroundColor.red), G:\(backgroundColor.green), B:\(backgroundColor.blue), Alpha: \(alpha.rawValue)"
    }
}



