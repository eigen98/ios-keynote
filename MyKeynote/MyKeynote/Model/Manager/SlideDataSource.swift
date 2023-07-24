//
//  SlideDataSource.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/20.
//

import Foundation
protocol SlideDataSource {
    func getSlideCount() -> Int
    func slide(at index: Int) -> SlideProtocol?
    func selectedSlide() -> SlideProtocol?
}
