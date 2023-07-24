//
//  MockSlideFactory.swift
//  MyKeynoteTests
//
//  Created by KoJeongMin  on 2023/07/24.
//

import XCTest
@testable import MyKeynote
class MockSlideFactory: SlideFactory {
    var createRandomSlideCalled = false
    override func createSlide(length: Int, backgroundColor: SlideRGBColor) -> BaseSlide {
        return BaseSlide(id: "mock", backgroundColor: backgroundColor)
    }
    
    override func createRandomSlide() -> BaseSlide {
        createRandomSlideCalled = true
        return BaseSlide(id: "mock", backgroundColor: SlideRGBColor(red: 0, green: 0, blue: 0))
    }
}
