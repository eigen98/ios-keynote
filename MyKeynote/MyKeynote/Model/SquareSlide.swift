//
//  SquareSlide.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/18.
//

import Foundation

class SquareSlide : Slide{
    
    private let id: String
    var length: Int
    var backgroundColor: SlideRGBColor
    var alpha: AlphaLevel = .level1
    private(set) var elements: [SlideElement] = []
    
    init(id: String, length: Int, backgroundColor: SlideRGBColor) {
        self.id = id
        self.length = length
        self.backgroundColor = backgroundColor
    }
    
    func prepareForDisplay() {
        
    }
    
    func addElement(_ element: SlideElement) {
        self.elements.append(element)
    }
    
    func removeElement(_ element: SlideElement) {
        
    }
    
    func display() {
        
    }
    
    
}

extension SquareSlide : CustomStringConvertible{
    var description: String {
        return "(\(id)), Side:\(length), R:\(backgroundColor.red), G:\(backgroundColor.green), B:\(backgroundColor.blue), Alpha: \(alpha.rawValue)"
    }
}



