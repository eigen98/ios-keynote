//
//  UIColor.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/20.
//

import Foundation
import UIKit
extension UIColor {
    convenience init(slideRGBColor: SlideRGBColor) {
        self.init(red: CGFloat(slideRGBColor.red) / 255.0,
                  green: CGFloat(slideRGBColor.green) / 255.0,
                  blue: CGFloat(slideRGBColor.blue) / 255.0,
                  alpha: 1.0)
    }
    
    var rgbHex: String? {
            guard let components = cgColor.components, components.count >= 3 else {
                return nil
            }
            let r = Float(components[0])
            let g = Float(components[1])
            let b = Float(components[2])
            return String(format: "0x%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
        }
}
