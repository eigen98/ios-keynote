//
//  Slide.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/17.
//

import Foundation
protocol Slide: SlideContentManageable, SlideDisplayable {
    var backgroundColor: SlideRGBColor { get set }
    var alpha: AlphaLevel { get set }
}
