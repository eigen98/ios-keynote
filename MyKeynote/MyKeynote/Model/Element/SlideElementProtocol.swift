//
//  SlideElement.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/18.
//

import Foundation

protocol SlideElementProtocol : Draggable, Selectable, Resizable, Order{
    var id: String { get }
    var size: CGSize { get set }
    var backgroundColor : SlideRGBColor {get set }
    var animation: AnimationApplicable? { get set }
    var alpha : AlphaLevel{ get set }

}













