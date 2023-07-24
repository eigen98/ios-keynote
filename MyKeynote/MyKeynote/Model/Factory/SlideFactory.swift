//
//  SlideFactory.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/17.
//

import Foundation

protocol SlideFactoryProtocol{
    var generator: RandomNumberGenerator { get }
    var idGenerator: IDGenerator { get }
    func createSlide(length: Int, backgroundColor: SlideRGBColor) -> BaseSlide
    func createRandomSlide() -> BaseSlide
}

class SlideFactory : SlideFactoryProtocol{
    
    
    var generator: RandomNumberGenerator
    let idGenerator: IDGenerator
    
    init(generator: RandomNumberGenerator = SystemRandomNumberGenerator()) {
        self.generator = generator
        self.idGenerator = IDGenerator()
    }
    func createSlide(length: Int, backgroundColor: SlideRGBColor) -> BaseSlide {
         let id = idGenerator.generateID(using: &generator)

         return BaseSlide(id: id, backgroundColor: backgroundColor)
     }
    
    func createRandomSlide() -> BaseSlide {
        let id = idGenerator.generateID(using: &generator)
        let color = SlideRGBColor(
            red: Int.random(in: 0...255, using: &generator),
            green: Int.random(in: 0...255, using: &generator),
            blue: Int.random(in: 0...255, using: &generator)
        )
        
        return BaseSlide(id: id, backgroundColor: color)
    }
    
}

