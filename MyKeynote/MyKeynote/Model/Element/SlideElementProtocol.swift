//
//  SlideElement.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/18.
//

import Foundation

protocol SlideElementProtocol : Selectable{
    var position: CGPoint { get set }
    var size: CGSize { get set }
    var backgroundColor : SlideRGBColor {get set }
    var animation: AnimationApplicable? { get set }
    var alpha : AlphaLevel{ get set }
    func display()
    
}












