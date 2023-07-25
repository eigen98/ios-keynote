//
//  MockComponentFactory.swift
//  MyKeynoteTests
//
//  Created by KoJeongMin  on 2023/07/24.
//

import XCTest
@testable import MyKeynote
class MockComponentFactory: SlideComponentFactoryProtocol {
    var createComponentCalled = false
    
    func createComponent<Element>(length: Int, backgroundColor: SlideRGBColor, type: Element.Type) -> Element where Element : BaseElement {
        createComponentCalled = true
        return Element.init(id: "mock", position: .zero, size: .init(width: length, height: length))
    }
}
