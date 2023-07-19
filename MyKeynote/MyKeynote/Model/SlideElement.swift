//
//  SlideElement.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/18.
//

import Foundation

protocol SlideElement {
    var position: CGPoint { get set }
    var size: CGSize { get set }
    var animation: AnimationApplicable? { get set }
    func display()
}













