//
//  SlideCollection.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/19.
//

import Foundation
struct SlideCollection {
    private var slideArray : [BaseSlide] = []

    subscript(index: Int) -> BaseSlide? {
        return (index >= 0 && index < slideArray.count) ? slideArray[index] : nil
    }
    
    mutating func addSlide(slide : BaseSlide){
        slideArray.append(slide)
        
    }
    
    func getCount() -> Int{
        return slideArray.count
    }
    
}
