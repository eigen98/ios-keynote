//
//  SlideRGBColor+.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/26.
//

import Foundation
import UIKit
extension SlideRGBColor {
    init?(color: UIColor) {
        guard let components = color.cgColor.components, components.count >= 3 else {
            return nil
        }
        
        self.red = Int(components[0] * 255.0)
        self.green = Int(components[1] * 255.0)
        self.blue = Int(components[2] * 255.0)
    }
}
