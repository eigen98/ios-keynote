//
//  ElementCollection.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/24.
//

import Foundation
struct ElementCollection {
    var elementArray : [SlideElementProtocol] = []

    subscript(index: Int) -> SlideElementProtocol? {
        return (index >= 0 && index < elementArray.count) ? elementArray[index] : nil
    }
    
    mutating func addElement(element : SlideElementProtocol){
        elementArray.append(element)
        
    }
    
    func getCount() -> Int{
        return elementArray.count
    }
    
    func getElement(id: String) -> SlideElementProtocol? {
        return elementArray.first(where: { $0.id == id })
    }
    
}
