//
//  ComponentFactory.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/20.
//

import Foundation
protocol SlideComponentFactoryProtocol{
    func createComponent<Element: BaseElement>(length: Int, backgroundColor: SlideRGBColor, type : Element.Type) -> Element
}

class SlideComponentFactory : SlideComponentFactoryProtocol{
    
    private var generator: RandomNumberGenerator
    private var idGenerator: IDGenerator

    init(generator: RandomNumberGenerator  = SystemRandomNumberGenerator()) {
        self.generator = generator
        self.idGenerator = IDGenerator()
    }
    
    func createComponent<Element: BaseElement>( length: Int,
                                                backgroundColor: SlideRGBColor,
                                                type: Element.Type) -> Element where Element : SlideElementProtocol {
        
        return type.init(id: idGenerator.generateID(using: &generator),
                         position: .zero,
                         size: .init(width: length, height: length))
    }
    
    
    
}
