//
//  MyKeynoteTests.swift
//  MyKeynoteTests
//
//  Created by KoJeongMin  on 2023/07/17.
//

import XCTest
@testable import MyKeynote

final class MyKeynoteTests: XCTestCase {

    
    var sut: SlideManager! // System Under Test
    var mockComponentFactory: MockComponentFactory!
    var mockSlideFactory: MockSlideFactory!
    var slideCollection: SlideCollection!
    
    
    
    override func setUpWithError() throws {
      
        mockComponentFactory = MockComponentFactory()
        mockSlideFactory = MockSlideFactory()
        slideCollection = SlideCollection()
        sut = SlideManager(componentFactory: mockComponentFactory,
                           slideFactory: mockSlideFactory,
                           slideCollection: slideCollection)
    }
    
    func testAddSlide() {
        // Given
        let initialSlideCount = sut.slideCount
        
        // When
        sut.addSlide()
        
        // Then
        XCTAssertEqual(sut.slideCount, initialSlideCount + 1)
        XCTAssertNotNil(sut.selectedSlide)
        XCTAssertTrue(mockSlideFactory.createRandomSlideCalled)
    }
    
    func testAddElement() {
        // Given
        let length = 200
        let color = SlideRGBColor(red: 100, green: 100, blue: 100)
        let type = RectangleElement.self
        
        sut.addSlide()
        
        // When
        sut.addElement(length: length, backgroundColor: color, type: type)
        
        // Then
        XCTAssertTrue(mockComponentFactory.createComponentCalled)
        XCTAssertEqual(sut.selectedSlide?.elements.getCount(), 1)
    }
    
    
    override func tearDown() {
        sut = nil
        mockComponentFactory = nil
        mockSlideFactory = nil
        slideCollection = nil
        
        super.tearDown()
    }
    
}
