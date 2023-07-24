//
//  BaseComponentView.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/23.
//

import Foundation
import UIKit
class BaseComponentView: UIView {
    private var element: SlideElementProtocol?{
        didSet {
            updateBorder()
        }
    }

    
    var color: UIColor {
        return self.backgroundColor ?? .clear
    }
    
    var alphaValue: Float {
        return element?.alpha.rawValue ?? 1.0
    }
    
    func configure(with rectangleElement: SlideElementProtocol) {
        self.element = rectangleElement
        self.frame.size = rectangleElement.size
        let rgbColor = rectangleElement.backgroundColor
  
        self.backgroundColor = .init(slideRGBColor: rgbColor)
        updateBorder()
    }
    
    func select() {
        element?.select()
        updateBorder()
    }
   
    func deselect() {
        element?.deselect()
        updateBorder()
    }

    private func updateBorder() {
        layer.borderWidth = element?.isSelected == true ? 4.0 : 0.0
        layer.borderColor = UIColor.blue.cgColor
    }
}
