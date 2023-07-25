//
//  AnimationProtocol.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/18.
//

import Foundation
protocol AnimationApplicable {
    var duration: TimeInterval { get set }
    func apply(to element: SlideElementProtocol)
}
