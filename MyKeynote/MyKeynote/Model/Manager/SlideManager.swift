//
//  SlideManager.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/19.
//

import Foundation
protocol SlideManaging {
    var slideCount: Int { get }
    mutating func addSlide()
    mutating func addElement(length: Int, backgroundColor: SlideRGBColor, type: BaseElement.Type)
    mutating func updateElementAlpha(alpha : AlphaLevel)
    mutating func updateElementBackgroundColor(rgbColor : SlideRGBColor)
    mutating func updateSelectedElement(id : String)
}

struct SlideManager : SlideManaging{

    private let componentFactory: SlideComponentFactoryProtocol
    private let slideFactory: SlideFactoryProtocol
    
    var slideCollection : SlideCollection
    
    var selectedSlide : SlideProtocol?
    var selectedElement : SlideElementProtocol?
    
    var slideCount : Int {
        return slideCollection.getCount()
    }
    
    
    init(componentFactory: SlideComponentFactoryProtocol, slideFactory: SlideFactoryProtocol, slideCollection: SlideCollection) {
        self.componentFactory = componentFactory
        self.slideFactory = slideFactory
        self.slideCollection = slideCollection
    }
    
    
    mutating func addSlide(){
        let newSlide = slideFactory.createRandomSlide()
        slideCollection.addSlide(slide: newSlide)
        selectedSlide = newSlide
    }
    
    mutating func addElement(length: Int, backgroundColor: SlideRGBColor, type: BaseElement.Type) {
        let newComponent = componentFactory.createComponent(length: length, backgroundColor: backgroundColor, type: type)
        guard let slide = selectedSlide else {
            return
        }
        slide.addElement(newComponent)
    }
    
    mutating func updateElementAlpha(alpha : AlphaLevel){
        selectedElement?.alpha = alpha
    }
    
    mutating func updateElementBackgroundColor(rgbColor : SlideRGBColor){
        selectedElement?.backgroundColor = rgbColor
    }
    
    mutating func updateSelectedElement(id : String){
        if let element = selectedSlide?.getElement(id: id){
            self.selectedElement = element
        }
        
    }
    
    
}

