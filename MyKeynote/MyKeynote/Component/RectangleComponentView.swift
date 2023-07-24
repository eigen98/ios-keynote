//
//  RectangleComponentView.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/20.
//

import Foundation
import UIKit
class RectangleComponentView: UIView {
    private var rectangleElement: RectangleElement?

    func configure(with rectangleElement: RectangleElement) {
        self.rectangleElement = rectangleElement
        self.frame.size = rectangleElement.size
        self.center = rectangleElement.position
        updateBorder()
    }

    func select() {
        rectangleElement?.select()
        updateBorder()
    }

    func deselect() {
        rectangleElement?.deselect()
        updateBorder()
    }

    private func updateBorder() {
        layer.borderWidth = rectangleElement?.isSelected == true ? 3.0 : 1.0
        
    }
}
