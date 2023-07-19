//
//  SlideFactory.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/17.
//

import Foundation

protocol SlideFactoryProtocol{
    func createSlide(length: Int, backgroundColor: SlideRGBColor) -> SquareSlide
    func createRandomSlide() -> SquareSlide
}

class SlideFactory : SlideFactoryProtocol{
    
    
    private var generator: RandomNumberGenerator
    private var idGenerator: IDGenerator
    
    init(generator: RandomNumberGenerator = SystemRandomNumberGenerator()) {
        self.generator = generator
        self.idGenerator = IDGenerator()
    }
    func createSlide(length: Int, backgroundColor: SlideRGBColor) -> SquareSlide {
         let id = idGenerator.generateID(using: &generator)

         return SquareSlide(id: id, length: length, backgroundColor: backgroundColor)
     }
    
    func createRandomSlide() -> SquareSlide {
        let id = idGenerator.generateID(using: &generator)
        let length = Int.random(in: 1...100, using: &generator)
        let color = SlideRGBColor(
            red: Int.random(in: 0...255, using: &generator),
            green: Int.random(in: 0...255, using: &generator),
            blue: Int.random(in: 0...255, using: &generator)
        )
        
        return SquareSlide(id: id, length: length, backgroundColor: color)
    }
    
}

