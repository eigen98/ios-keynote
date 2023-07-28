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
    
    mutating func moveSlide(from sourceIndex: Int, to destinationIndex: Int) {
        guard sourceIndex != destinationIndex,
              sourceIndex >= 0 && sourceIndex < slideArray.count,
              destinationIndex >= 0 && destinationIndex < slideArray.count else {
            return
        }
        
        let movedSlide = slideArray[sourceIndex]
        slideArray.remove(at: sourceIndex)
        slideArray.insert(movedSlide, at: destinationIndex)
    }
    
}
