//
//  BaseComponentView.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/23.
//

import Foundation
import UIKit
class BaseComponentView: UIView {
    
    var id : String = ""
    var isSelected: Bool? {
            didSet {
                updateBorder()
            }
        }
    
    func configure(with rectangleElement: SlideElementProtocol) {
        id = rectangleElement.id
        self.frame.size = rectangleElement.size
        let rgbColor = rectangleElement.backgroundColor
  
        self.backgroundColor = .init(slideRGBColor: rgbColor)
        updateBorder()
    }
    
    func updateSelectedState(isSelected: Bool) {
            self.isSelected = isSelected
        }

    private func updateBorder() {
        layer.borderWidth = self.isSelected == true ? 4.0 : 0.0
        layer.borderColor = UIColor.blue.cgColor
    }
}
