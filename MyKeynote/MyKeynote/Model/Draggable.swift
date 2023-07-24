//
//  Draggable.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/24.
//

import Foundation
//드래그 기능
protocol Draggable{
    var position: CGPoint { get set }
    
    func startDrag(at point: CGPoint)
    func drag(to point: CGPoint)
    func endDrag(at point: CGPoint)
}
