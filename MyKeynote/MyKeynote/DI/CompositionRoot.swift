//
//  CompositionRoot.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/24.
//

import Foundation
class CompositionRoot {
    static let shared = CompositionRoot()
    
    let rootViewController: KeynoteViewController
    let slideManager: SlideManager
    let componentFactory: SlideComponentFactoryProtocol
    let slideFactory: SlideFactoryProtocol
    let slideCollection: SlideCollection
    
    private init() {
        componentFactory = SlideComponentFactory()
        slideFactory = SlideFactory()
        slideCollection = SlideCollection()
        slideManager = SlideManager(componentFactory: componentFactory,
                                    slideFactory: slideFactory,
                                    slideCollection: slideCollection)
        rootViewController = KeynoteViewController(slideManager: slideManager)
    }
}




