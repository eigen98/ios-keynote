//
//  SlideDisplayable.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/18.
//SlideDisplayable

import Foundation
//순서 프로토콜
protocol Order{
    var orderIndex: Int { get set }
    
    func moveForward()
    func moveBackward()
}
